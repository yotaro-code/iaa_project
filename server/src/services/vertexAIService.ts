import * as vertexai from "@google-cloud/vertexai";
import { getAgentData } from "./firestoreService"; // Firestoreサービスを利用

/**
 * Vertex AIクライアントの初期化
 */
const vertexAIClient = new vertexai.VertexAI({
  project: process.env.GCP_PROJECT_ID || "carbon-crossing-446001-p7",
  location: "asia-northeast1", // Tokyo region
});

/**
 * プロンプトを生成
 * @param agentId エージェントID
 * @param conversationHistory 過去の会話履歴
 * @param userText ユーザーの最新の回答
 * @param currentRound 現在のラウンド番号
 * @param promptType プロンプトの種類（"interview" | "feedback"）
 * @returns Geminiから生成された質問またはフィードバック
 */
export const generatePrompt = async (
  agentId: string,
  conversationHistory: Array<{ role: string; message: string }>,
  userText: string,
  currentRound: number,
  promptType: "interview" | "feedback"
): Promise<string> => {
  try {
    // Firestoreからエージェントデータを取得
    const agentData = await getAgentData(agentId);
    if (!agentData) {
      throw new Error(`Agent data not found for agentId: ${agentId}`);
    }

    const {
      description,
      maxRounds,
      topicSwitchRounds,
      topics,
      feedbackTemplate,
    } = agentData;

    // 会話履歴を文字列に変換
    const historyText =
      conversationHistory.length > 0
        ? conversationHistory.map((c, index) => `${index % 2 === 0 ? "Q" : "A"}. ${c.message}`).join("\n")
        : "初回のため無し";

    // プロンプトの初期値
    let prompt = "";

    if (promptType === "interview") {
      // トピックを決定
      let currentTopic = topics[0]; // デフォルトは最初のトピック
      for (const round of topicSwitchRounds) {
        if (currentRound >= round) {
          currentTopic = topics[topicSwitchRounds.indexOf(round)];
        }
      }

      console.log('直前までの会話履歴:${historyText}');

      prompt = `
        # あなたの役割
        ${description}

        # 会話の設定
        - この面接では、${maxRounds}回のやり取りを行います。
        - 現在は ${currentRound} 回目のやり取りです。
        - 現在の質問テーマ: ${currentTopic.name}
        - テーマに関するガイダンス: ${currentTopic.guidance}
        - キーワード: ${currentTopic.keywords.join(", ")}

        # 質問に関する指示
        - あなたは面接官の役割を担うAIです。
        - 面接官として、以下の会話履歴を必ず参照し、直近のユーザーの回答を深掘りする「質問」を「1つ」だけ生成してください。
        - 直前の質問内容と重複しないようにしてください。
        - 質問は100文字以内で簡潔に表現してください。
        - 質問には絵文字や記号を使用しないでください。音声変換できる文字だけ利用してください。
        - 〇〇などの決まっていない表現は使わないでください。

        # 出力例
        ありがとうございます。先ほどのプロダクトについて、具体的にどう開発したのか、具体的に教えてください。

        # 面接の会話履歴（Qがあなたの質問、Aがユーザーの回答）
        ${historyText}

      `;
    } else if (promptType === "feedback") {
      prompt = `
        あなたは面接官の役割を担うAIです。「面接の会話履歴」を利用し、以下の条件に基づいて、ユーザーが面接練習で回答した内容を評価し、フィードバックを作成してください。
    
        # あなたの役割
        ${description}
    
        # フィードバックの指示
        - ${feedbackTemplate.guidance}
        - ガイドライン:
          ${feedbackTemplate.points.map((point, index) => `${index + 1}. ${point}`).join("\n")}
    
        #### 条件:
        1. 良かった点と改善点をそれぞれ詳細（300文字以内）と要約（100文字以内）で記述してください。
        2. 会話履歴から評価を5段階（1=非常に不十分、2=不十分、3=普通、4=優れている、5=非常に優れている）で行ってください。
        3. 評価理由を200文字以内で具体的に説明してください。
        4. 面接結果（合格または不合格）を記載してください。
        5. 合否の理由を具体的に説明してください。
        6. 言葉遣いはポジティブで、ユーザーの成長をサポートする要素を含めてください。
        7. ユーザーは音声で回答しています。話言葉になるため、テキストでは言葉遣いが綺麗に見えない可能性は考慮して評価してください。
    
        #### 出力形式:json
        {
          "feedback": {
            "good_points": {
              "detailed": "ここに良かった点の詳細を記載します。300文字以内",
              "summary": "ここに良かった点の要約を記載します。100文字以内"
            },
            "improvement_points": {
              "detailed": "ここに改善点の詳細を記載します。300文字以内",
              "summary": "ここに改善点の要約を記載します。100文字以内"
            },
            "evaluationScore": 4, // 1=非常に不十分 ～ 5=非常に優れている
            "evaluationReason": "ここに評価理由を記載します。",
            "passOrFail": "合格", // "合格" または "不合格"
            "reason": "ここに合否の理由を記載します。"
          }
        }
    
        #### 面接の会話履歴（Qがあなたの質問、Aがユーザーの回答）
        ${historyText}
      `;
    } else {
      throw new Error("Invalid prompt type provided");
    }

    console.log(`依頼するprompt: ${prompt}`);

    // Vertex AI モデルを初期化してプロンプトを送信
    const generativeModel = vertexAIClient.preview.getGenerativeModel({
      model: "gemini-1.5-flash-002",
      // model: "gemini-1.5-flash-001",
      generationConfig: {
        maxOutputTokens: 8192,
        temperature: 1,
        topP: 0.95,
      },
    });

    // チャットセッションを開始
    const chat = generativeModel.startChat({});
    const streamResult = await chat.sendMessageStream(prompt.trim());

    // ストリーム結果から応答を取得
    const candidates = (await streamResult.response)?.candidates;

    if (!candidates || candidates.length === 0) {
      throw new Error("No candidates returned from Vertex AI");
    }

    // Gemini APIのレスポンスの内容を抽出
    const responseText = candidates[0]?.content?.parts?.[0]?.text || null;

    if (!responseText || typeof responseText !== "string" || !responseText.trim()) {
      throw new Error("Invalid response content from Vertex AI");
    }

    // 最終的なテキストデータを返却
    return responseText.trim();
  } catch (error) {
    console.error("Error generating prompt with Vertex AI:", error);
    throw new Error("Vertex AI prompt generation failed");
  }
};
