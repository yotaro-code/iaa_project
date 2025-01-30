import * as vertexai from "@google-cloud/vertexai";
import { v4 as uuidv4 } from "uuid";

// ====== 1. Text-to-Speech Configなど事前に用意した設定を定義 ======

interface TtsConfig {
  ssmlGender: string;
  name: string;
  speakingRate: number;
  pitch: number;
}

interface PresetConfig {
  textToSpeechConfig: TtsConfig;
  imageUrl: string;
}

// 1次面接官 (2パターン: 男性 / 女性)
const FIRST_INTERVIEW_PRESETS: PresetConfig[] = [
  {
    textToSpeechConfig: {
      ssmlGender: "MALE",
      name: "ja-JP-Standard-C",
      speakingRate: 1.1,
      pitch: 0.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Ffirst_interviewer_1.webp?alt=media&token=7fd7be79-155b-426b-b41b-fe46bf8ccaec",
  },
  {
    textToSpeechConfig: {
      ssmlGender: "FEMALE",
      name: "ja-JP-Standard-B",
      speakingRate: 1.0,
      pitch: -2.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Ffirst_interviewer_2.webp?alt=media&token=be71fcdf-5b18-4847-85db-9df88aeb2e1c",
  },
];

// 2次面接官 (2パターン: 男性 / 女性)
const SECOND_INTERVIEW_PRESETS: PresetConfig[] = [
  {
    textToSpeechConfig: {
      ssmlGender: "MALE",
      name: "ja-JP-Standard-D",
      speakingRate: 1.3,
      pitch: -1.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Fsecond_interviewer_1.webp?alt=media&token=b529e165-5c29-4fe1-bd42-67f4f3d8e6d2",
  },
  {
    textToSpeechConfig: {
      ssmlGender: "FEMALE",
      name: "ja-JP-Neural2-B",
      speakingRate: 1.2,
      pitch: -1.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Fsecond_interviewer_2.webp?alt=media&token=0916ebcc-8580-4f1d-bd96-27021e3aa4a7",
  },
];

// 最終面接官 (2パターン: 男性 / 女性)
const FINAL_INTERVIEW_PRESETS: PresetConfig[] = [
  {
    textToSpeechConfig: {
      ssmlGender: "MALE",
      name: "ja-JP-Wavenet-C",
      speakingRate: 1.5,
      pitch: -3.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Ffinal_interviewer_1.webp?alt=media&token=a7e55919-7090-4227-a286-c2dacb00ebeb",
  },
  {
    textToSpeechConfig: {
      ssmlGender: "FEMALE",
      name: "ja-JP-Wavenet-A",
      speakingRate: 1.6,
      pitch: -5.0,
    },
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/carbon-crossing-446001-p7.firebasestorage.app/o/agents_img%2Ffinal_interviewer_2.webp?alt=media&token=449c7ba6-955c-4d9f-a890-001e1b3e8568",
  },
];

// ロール情報（Geminiが返すJSON順を想定）
const AGENT_ROLES = [
    {
      role: "first_interview",
      displayName: "一次面接官",
      feedbackGuidance: "以下の基準に基づき、一次面接官としてフィードバックを作成してください。合格を出しても採用される可能性は低いため、評価のハードルは低めでも良いです。",
      presets: FIRST_INTERVIEW_PRESETS,
    },
    {
      role: "second_interview",
      displayName: "二次面接官",
      feedbackGuidance: "以下の基準に基づき、二次面接官としてフィードバックを作成してください。合格を出しても採用されるとは限りませんので、ポテンシャルがあれば、評価のハードルを低くしても構いません。",
      presets: SECOND_INTERVIEW_PRESETS,
    },
    {
      role: "final_interview",
      displayName: "最終面接官",
      feedbackGuidance: "以下の基準に基づき、最終面接官としてフィードバックを作成してください。",
      presets: FINAL_INTERVIEW_PRESETS,
    },
  ];

// ====== 2. Gemini呼び出しを初期化 ======
const vertexAIClient = new vertexai.VertexAI({
  project: process.env.GCP_PROJECT_ID || "carbon-crossing-446001-p7",
  location: "asia-northeast1", // 例: Tokyo region
});

/**
 * Gemini API を使用して面接官データを生成
 * → agentName は 「inputAgentName - displayName」の形式にする
 *
 * @param inputAgentName  Flutterなどから受け取る任意の名前
 * @param description  募集要項や条件
 * @returns 3名の面接官データ（topicsやfeedbackTemplateはGemini生成、その他は事前設定）
 */
export async function generateInterviewAgents(
    inputAgentName: string,
    description: string
  ): Promise<any[]> {
    try {
      // --- プロンプトを詳細化 ---
    //   ・「一次面接官 / 二次面接官 / 最終面接官」それぞれについて
    //   ・ "description", "topicSwitchRounds", "topics", "feedbackTemplate" を必ず含む
    //   ・ feedbackTemplate.guidance は固定
    //   ・ points は各面接官の役割に合った内容を生成
    const prompt = `
    以下の「募集要項」を踏まえた上で、3人の面接官(一次面接官/二次面接官/最終面接官)の設定を作成してください。
    各面接官ごとに以下の構造を必ず持つ JSON オブジェクトを生成し、最終的に3つのオブジェクトを要素とする配列を出力してください。
    
    1. 【一次面接官】
       - description: "基礎スキルと適性を確認するための一次面接官"
       - topicSwitchRounds: [1, 4]  // maxRounds は 6 に固定するため、ラウンド1と4で話題を切り替える例
       - topics: 面接の話題を複数定義 (例: 自己紹介, 基本的なスキル など)
         - name: トピック名
         - guidance: 質問や話題を促すための文章
         - keywords: 関連するキーワードの配列
       - feedbackTemplate: {
           guidance: "以下の基準に基づきフィードバックを作成してください。",
           points: [
             "一次面接官として評価すべきポイント1（基準はなるべく低く）",
             "一次面接官として評価すべきポイント2（基準はなるべく低く）",
             "一次面接官として評価すべきポイント3（基準はなるべく低く）"
           ]
         }
    
    2. 【二次面接官】
       - description: "専門性とスキルを深堀りするための二次面接官"
       - topicSwitchRounds: [1, 4]
       - topics: (例: プロジェクト経験、問題解決能力 など)
       - feedbackTemplate: {
           guidance: "以下の基準に基づきフィードバックを作成してください。",
           points: [
             "二次面接官として評価すべきポイント1（基準は少し低く）",
             "二次面接官として評価すべきポイント2（基準は少し低く）",
             "二次面接官として評価すべきポイント3（基準は少し低く）"
           ]
         }
    
    3. 【最終面接官】
       - description: "総合評価と文化フィットを確認するための最終面接官"
       - topicSwitchRounds: [1, 4]
       - topics: (例: キャリアビジョン、文化フィット など)
       - feedbackTemplate: {
           guidance: "以下の基準に基づきフィードバックを作成してください。",
           points: [
             "最終面接官として評価すべきポイント1",
             "最終面接官として評価すべきポイント2",
             "最終面接官として評価すべきポイント3"
           ]
         }
    
    ■ 出力フォーマット (配列のみ):
    [
      {
        "description": string,
        "topicSwitchRounds": [1, 4],
        "topics": [...],
        "feedbackTemplate": {...}
      },
      {
        ... // 二次面接官
      },
      {
        ... // 最終面接官
      }
    ]
    
    ■ 注意:
    - 配列は3つの要素のみ (一次面接官、二次面接官、最終面接官)。
    - 各オブジェクトに "description", "topicSwitchRounds", "topics", "feedbackTemplate" の4つを必ず含める。
    - feedbackTemplate.guidance は "以下の基準に基づきフィードバックを作成してください。" で固定する。
    - "points" は面接官の特徴および以下の募集要項に沿った内容を3つほど挙げる。
    
    【募集要項】
    ${description}
    
    出力は上記フォーマットの3つのJSONオブジェクトを要素とする配列だけを返してください。
    説明以外の要素（agentId など）は含めなくて結構です。
        `;
    
        // Geminiモデルを取得
        const generativeModel = vertexAIClient.preview.getGenerativeModel({
          model: "gemini-1.5-pro-002",
          generationConfig: {
            maxOutputTokens: 2048,
            temperature: 1,
            topP: 0.95,
          },
        });
    
        // チャットを開始してメッセージを送信
        const chat = generativeModel.startChat({});
        const streamResult = await chat.sendMessageStream(prompt.trim());
    
        // ストリーム結果から候補を取得
        const candidates = (await streamResult.response)?.candidates;
        if (!candidates || candidates.length === 0) {
          throw new Error("No candidates returned from Vertex AI Gemini.");
        }
    
        // テキスト抽出
        const responseText = candidates[0]?.content?.parts?.[0]?.text || "";
        if (!responseText.trim()) {
          throw new Error("Empty response from Gemini.");
        }

        console.log(responseText);

        // ここで 「```json ... ```」 などを除去
        const sanitizedText = responseText
        .replace(/```json/g, "") // ```json を空文字に
        .replace(/```/g, "")     // ``` を空文字に
        .trim();
    
        // JSON パース
        interface GeminiAgent {
          description?: string;
          topicSwitchRounds?: number[];
          topics?: Array<{
            name?: string;
            guidance?: string;
            keywords?: string[];
          }>;
          feedbackTemplate?: {
            guidance?: string;
            points?: string[];
          };
        }
    
        let geminiAgents: GeminiAgent[];
        try {
          geminiAgents = JSON.parse(sanitizedText.trim());
        } catch (parseErr) {
          console.error("Gemini response parse error:", parseErr);
          throw new Error("Failed to parse Gemini JSON response.");
        }
    
        if (!Array.isArray(geminiAgents) || geminiAgents.length !== 3) {
          throw new Error("Gemini response does not contain 3 agents array.");
        }
    
        // ====== 生成したデータを上書きして、最終的な形式に整形 ======
        const finalAgents = geminiAgents.map((agentData, idx) => {
          const roleInfo = AGENT_ROLES[idx];
          if (!roleInfo) {
            throw new Error(`Unexpected role index: ${idx}`);
          }
    
          // ランダムに男性か女性のプリセットを選択
          const randomPreset =
            roleInfo.presets[Math.floor(Math.random() * roleInfo.presets.length)];
    
          // agentId: 例 "first_interview-xxxxxx"
          const agentId = `${roleInfo.role}-${uuidv4().split("-")[0]}`;
    
          // agentName: "inputAgentName - displayName" 形式
          const agentName = `${inputAgentName} - ${roleInfo.displayName}`;
    
          // maxRounds は固定(例: 6)
          const maxRounds = 6;
    
          // topicSwitchRounds は Gemini 側で [1,4] を返すよう指示したが、
          // 念のため "topicSwitchRounds" が無ければ上書き
          const topicSwitchRounds = agentData.topicSwitchRounds || [1, 4];
    
          // feedbackTemplate.guidance を面接官の種類ごとに適切な内容に修正
            const feedbackTemplate = {
                guidance: roleInfo.feedbackGuidance, // 面接官ごとに適切なguidanceを設定
                ...agentData.feedbackTemplate,
            };
    
          return {
            // Gemini から返った情報をベースにしつつ、こちらで必要項目を追加 or 上書き
            agentId,
            name: agentName,
            description: agentData.description || `自動生成: ${roleInfo.displayName}`,
            maxRounds,
            topicSwitchRounds,
            topics: agentData.topics || [],
            feedbackTemplate,
            textToSpeechConfig: randomPreset.textToSpeechConfig,
            imageUrl: randomPreset.imageUrl,
            lastUpdated: new Date().toISOString(),
          };
        });
    
        return finalAgents;
      } catch (error) {
        console.error("Error in generateInterviewAgents:", error);
        throw new Error("Failed to generate agents using Vertex AI (Gemini).");
      }
    }