import express, { Request, Response } from "express";
import * as bodyParser from "body-parser";
import { saveAgentsToFirestore } from "./firestore-client";
import { generateInterviewAgents } from "./vertexai-client"; 
// ↑ あなたが作成した generateInterviewAgents 関数があるファイルを import

const app = express();

// JSON & URLエンコードのボディサイズ制限を緩和
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ extended: true, limit: "50mb" }));

/**
 * Firestore に面接官情報を保存する API
 */
app.post("/generate-agents", async (req: Request, res: Response): Promise<void> => {
  try {
    const { agentName, agentInformation } = req.body;

    // 必須パラメータのバリデーション
    if (!agentName || !agentInformation) {
      res.status(400).json({ error: "agentName and agentInformation are required" });
      return;
    }

    // Vertex AI (Gemini) で 3人の面接官情報を生成
    const agents = await generateInterviewAgents(agentName, agentInformation);

    // Firestore に保存
    await saveAgentsToFirestore(agents);

    // 成功レスポンス
    res.status(200).json({
      message: "Agent data successfully generated and saved to Firestore.",
    });
  } catch (error: unknown) {
    console.error("Error generating/saving agent data:", error);
    const errMsg = error instanceof Error ? error.message : "Internal Server Error";
    res.status(500).json({ error: errMsg });
  }
});

// Cloud Run Functions 用に `app` をエクスポート
export { app };
