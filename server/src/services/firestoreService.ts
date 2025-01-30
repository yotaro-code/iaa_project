import { Firestore, Timestamp } from "@google-cloud/firestore";

// Firestoreクライアントの初期化
const firestore = new Firestore();

/**
 * セッションデータを保存
 * @param sessionId セッションID（ユニークなセッション識別子）
 * @param agentId エージェントID（エージェントを特定するID）
 * @param userId ユーザーID（ユーザーを特定するID）
 * @param currentRound 現在のラウンド番号（1から開始するインタビューの進行状況）
 * @param conversationHistory 会話履歴（面接官とユーザー間のメッセージの配列）
 * @param feedback フィードバック情報（良かった点、改善点、評価スコア、合否理由を含むオブジェクト）
 *    - good_points_detailed: 良かった点の詳細（500文字以内）
 *    - good_points_summary: 良かった点の要約（100文字以内）
 *    - improvement_points_detailed: 改善点の詳細（500文字以内）
 *    - improvement_points_summary: 改善点の要約（100文字以内）
 *    - evaluationScore: 評価スコア（1=非常に不十分 ～ 5=非常に優れている）
 *    - evaluationReason: 評価理由（なぜそのスコアにしたのかを説明）
 *    - passOrFail: 合否結果（"合格" または "不合格"）
 *    - reason: 合否の理由（合否に至った理由を具体的に記載）
 */
export const saveSessionData = async (
  sessionId: string,
  agentId: string,
  userId: string,
  currentRound: number,
  conversationHistory: Array<{ role: string; message: string; audioData?: string }>,
  feedback: {
    good_points_detailed: string;
    good_points_summary: string;
    improvement_points_detailed: string;
    improvement_points_summary: string;
    evaluationScore: number | null; // 評価スコア（null 初期値許容）
    evaluationReason: string;
    passOrFail: string;
    reason: string;
  } = {
    good_points_detailed: "",
    good_points_summary: "",
    improvement_points_detailed: "",
    improvement_points_summary: "",
    evaluationScore: null,
    evaluationReason: "",
    passOrFail: "",
    reason: "",
  }
): Promise<void> => {
  const sessionRef = firestore.collection("sessions").doc(sessionId);
  const data = {
    sessionId,
    agentId,
    userId,
    currentRound,
    conversationHistory,
    feedback, // フィードバックを含める
    createdAt: Timestamp.now(), // 新規作成時のタイムスタンプ
    updatedAt: Timestamp.now(), // 最終更新時のタイムスタンプ
  };

  await sessionRef.set(data, { merge: true });
};



/**
 * セッションデータを取得
 * @param sessionId セッションID
 * @returns セッションデータ
 */
export const getSessionData = async (sessionId: string): Promise<any> => {
  const sessionRef = firestore.collection("sessions").doc(sessionId);
  const doc = await sessionRef.get();
  if (!doc.exists) {
    throw new Error("Session not found");
  }
  return doc.data();
};

/**
 * エージェントコレクションのデータを取得
 * @param agentId エージェントID（例: "junior_engineer", "tech_lead", "manager"）
 * @returns エージェントの詳細情報
 */
export const getAgentData = async (
  agentId: string
): Promise<{
  agentId: string;
  name: string;
  description: string;
  maxRounds: number;
  topicSwitchRounds: number[];
  topics: Array<{
    name: string;
    guidance: string;
    keywords: string[];
  }>;
  feedbackTemplate: {
    guidance: string;
    points: string[];
  };
  textToSpeechConfig: {
    ssmlGender: string;
    name: string;
    speakingRate: number;
    pitch: number;
  };
  imageUrl: string;
  lastUpdated: string;
} | null> => {
  try {
    // Firestoreの`agents`コレクションからエージェントデータを取得
    const agentDoc = firestore.collection("agents").doc(agentId);
    const agentSnapshot = await agentDoc.get();

    if (!agentSnapshot.exists) {
      console.error(`Agent with ID ${agentId} does not exist in Firestore.`);
      return null;
    }

    const agentData = agentSnapshot.data();
    if (!agentData) {
      console.error(`Failed to retrieve data for agent ID ${agentId}.`);
      return null;
    }

    // 必要なフィールドを返却
    return {
      agentId: agentData.agentId || agentId,
      name: agentData.name || "Unknown",
      description: agentData.description || "No description provided.",
      maxRounds: agentData.maxRounds || 0,
      topicSwitchRounds: agentData.topicSwitchRounds || [],
      topics: agentData.topics || [],
      feedbackTemplate: agentData.feedbackTemplate || {
        guidance: "",
        points: [],
      },
      textToSpeechConfig: agentData.textToSpeechConfig || {
        ssmlGender: "NEUTRAL",
        name: "",
        speakingRate: 1.0,
        pitch: 0.0,
      },
      imageUrl: agentData.imageUrl || "",
      lastUpdated: agentData.lastUpdated || "",
    };
  } catch (error) {
    console.error("Error retrieving agent data:", error);
    throw new Error("Failed to retrieve agent data from Firestore.");
  }
};

  /**
 * 指定されたエージェントの音声設定を取得
 * @param agentId エージェントID
 * @returns 音声設定
 */
export const getAgentSpeechConfig = async (agentId: string): Promise<{
  ssmlGender: string;
  name: string;
  speakingRate: number;
  pitch: number;
}> => {
  try {
    const agentDoc = firestore.collection("agents").doc(agentId);
    const agentSnapshot = await agentDoc.get();

    if (!agentSnapshot.exists) {
      throw new Error(`Agent with ID ${agentId} does not exist in Firestore.`);
    }

    const agentData = agentSnapshot.data();
    if (!agentData?.textToSpeechConfig) {
      throw new Error(`Agent with ID ${agentId} does not have text-to-speech configuration.`);
    }

    return {
      ssmlGender: agentData.textToSpeechConfig.ssmlGender || "NEUTRAL",
      name: agentData.textToSpeechConfig.name || "ja-JP-Wavenet-C",
      speakingRate: agentData.textToSpeechConfig.speakingRate || 1.0,
      pitch: agentData.textToSpeechConfig.pitch || 0.0,
    };
  } catch (error) {
    console.error("Error fetching agent speech config:", error);
    throw new Error("Failed to fetch agent speech config.");
  }
};

  /**
 * エージェントコレクション内の全エージェントデータを取得
 * @returns 全エージェントの詳細情報の配列
 */
export const getAllAgentsData = async (): Promise<
Array<{
  AgentId: string;
  Name: string;
  Description: string;
  PromptTemplates: any;
  RoleSpecificTopics: any[];
  LastUpdated: string;
}>
> => {
try {
  const agentsCollection = firestore.collection("agents");
  const agentsSnapshot = await agentsCollection.get();

  if (agentsSnapshot.empty) {
    console.error("No agents found in Firestore.");
    return [];
  }

  const agentsData: Array<{
    AgentId: string;
    Name: string;
    Description: string;
    PromptTemplates: any;
    RoleSpecificTopics: any[];
    LastUpdated: string;
  }> = [];

  agentsSnapshot.forEach((doc) => {
    const data = doc.data();
    agentsData.push({
      AgentId: data.AgentId || doc.id,
      Name: data.Name || "Unknown",
      Description: data.Description || "",
      PromptTemplates: data.PromptTemplates || {},
      RoleSpecificTopics: data.RoleSpecificTopics || [],
      LastUpdated: data.LastUpdated || "",
    });
  });

  return agentsData;
} catch (error) {
  console.error("Error retrieving all agent data:", error);
  throw new Error("Failed to retrieve all agent data from Firestore.");
}
};
