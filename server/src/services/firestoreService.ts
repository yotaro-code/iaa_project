import { Firestore, Timestamp } from "@google-cloud/firestore";

// Firestoreクライアントの初期化
const firestore = new Firestore();

/**
 * セッションデータを保存
 * @param sessionId セッションID
 * @param agentId エージェントID
 * @param userId ユーザーID
 * @param currentRound 現在のラウンド番号
 * @param conversationHistory 会話履歴
 * @param feedback フィードバック情報
 */
export const saveSessionData = async (
  sessionId: string,
  agentId: string,
  userId: string,
  currentRound: number,
  conversationHistory: Array<{ role: string; message: string; audioData?: string }>,
  feedback: { good_points_detailed: string; improvement_points_detailed: string } = { 
    good_points_detailed: "", 
    improvement_points_detailed: "" // 初期値として空文字列を設定
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
export const getAgentData = async (agentId: string): Promise<{
    AgentId: string;
    Name: string;
    Description: string;
    PromptTemplates: any;
    RoleSpecificTopics: any[];
    LastUpdated: string;
  } | null> => {
    try {
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
  
      return {
        AgentId: agentData.AgentId || agentId,
        Name: agentData.Name || "Unknown",
        Description: agentData.Description || "",
        PromptTemplates: agentData.PromptTemplates || {},
        RoleSpecificTopics: agentData.RoleSpecificTopics || [],
        LastUpdated: agentData.LastUpdated || "",
      };
    } catch (error) {
      console.error("Error retrieving agent data:", error);
      throw new Error("Failed to retrieve agent data from Firestore.");
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
