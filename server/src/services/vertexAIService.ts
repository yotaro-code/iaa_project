import * as vertexai from "@google-cloud/vertexai";

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
    // モデルを初期化
    const generativeModel = vertexAIClient.preview.getGenerativeModel({
      model: "gemini-1.5-flash-001",
      generationConfig: {
        maxOutputTokens: 8192,
        temperature: 1,
        topP: 0.95,
      },
    });

    // プロンプトの条件分岐
    let prompt = "";
    if (promptType === "interview") {
      const latestUserResponse = conversationHistory
        .slice(-1)[0]?.message || "回答がまだありません";

      const historyText =
        conversationHistory.length > 0
          ? conversationHistory
              .map((c, index) => `${index % 2 === 0 ? "Q" : "A"}. ${c.message}`)
              .join("\n")
          : "初回のため無し";

      prompt = `
        # あなたの役割
        あなたは「若手エンジニアを対象とした面接官」です。

        # 会話の設定
        - この面接では、6回のやり取りを行います。
        - 現在は ${currentRound} 回目のやり取りです。
        - 面接官として、以下の会話履歴を参照し、直近のユーザーの回答を深掘りする質問を1つだけ生成してください。
        - 初回の質問はすでに提示済みです。
        - 次の質問を100文字以内で簡潔に表現してください。

        # 質問に関する指示
        - 質問の目的は、相手の自己紹介や過去の経験を深掘りし、より具体的な回答を引き出すことです。
        - 質問には絵文字や記号は使用しないでください。
        - 特に直近のユーザーの回答に基づき、具体的で掘り下げた質問をしてください。

        # 出力例
        - 質問は以下のような形式で出力してください（100文字以内）。
          - 「あなたがこれまでの経験で最も成長を感じた瞬間について教えてください。」

        # 面接の会話履歴
        ${historyText}

        # ユーザーの直近の回答
        ${latestUserResponse}
      `;
    } else if (promptType === "feedback") {
      const historyText =
        conversationHistory.length > 0
          ? conversationHistory
              .map((c, index) => `${index % 2 === 0 ? "Q" : "A"}. ${c.message}`)
              .join("\n")
          : "面接の会話履歴が存在しません。";

          prompt = `
          あなたは面接官の役割を担うAIです。以下の条件に基づいて、ユーザーが面接練習で回答した内容を評価し、良かった点と改善点をそれぞれ500文字以内で詳細に記述してください。また、それぞれ100文字以内に要約したフィードバックも作成してください。フィードバックは、ユーザーが次の面接で自信を持ち、改善を目指せるように前向きな内容を心がけてください。絵文字や記号は含めてはいけません。出力形式は絶対守ること。
  
          #### 条件:
          1. フィードバックは、良かった点と改善点の2つの項目に分けて記述してください。
          2. フィードバックの内容には、ユーザーの回答に具体的に触れてください。
          3. 改善点は、ユーザーが具体的に次に取り組むべき課題や方法を提示してください。
          4. 良かった点と改善点は、それぞれ詳細文（500文字以内）と要約文（100文字以内）の両方を作成してください。
          5. 言葉遣いはポジティブで、ユーザーの成長をサポートする励ましの要素を含めてください。
  
          #### 出力形式:json
          {
            "feedback": {
              "good_points": {
                "detailed": "ここに良かった点の詳細を記載します。",
                "summary": "ここに良かった点の要約を記載します。"
              },
              "improvement_points": {
                "detailed": "ここに改善点の詳細を記載します。",
                "summary": "ここに改善点の要約を記載します。"
              }
            }
          }
  
          #### 面接の会話履歴
          ${historyText}
        `;
    } else {
      throw new Error("Invalid prompt type provided");
    }

    console.log(`依頼するprompt: ${prompt}`);

    // チャットセッションを開始
    const chat = generativeModel.startChat({});
    console.log(`チャットセッションを開始`);

    // プロンプトを送信してストリーム結果を取得
    const streamResult = await chat.sendMessageStream(prompt.trim());
    console.log(`プロンプトを送信してストリーム結果を取得`);

    // ストリーム結果から応答を取得
    const candidates = (await streamResult.response)?.candidates;
    console.log(`ストリーム結果から応答を取得: ${JSON.stringify(candidates, null, 2)}`);

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
