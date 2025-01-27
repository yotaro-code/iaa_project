import * as grpc from "@grpc/grpc-js";
import { loadProto } from "./utils/protoLoader";
import { initializeSession, processAudio } from "./services/audioService";
import * as dotenv from "dotenv";

// 環境変数を最優先で読み込む
dotenv.config();

/**
 * gRPC サーバを起動
 */
const startServer = async () => {
  try {
    console.log("Starting gRPC server...");

    const server = new grpc.Server();

    // Protoファイルを読み込む
    let proto;
    try {
      proto = loadProto();
      console.log("Proto definitions loaded successfully.");
    } catch (error) {
      console.error("Failed to load proto definitions:", error);
      process.exit(1); // 起動失敗時はプロセスを終了
    }

    // AudioServiceを登録
    server.addService(proto.audio.AudioService.service, {
      InitializeSession: initializeSession,
      ProcessAudio: processAudio,
    });

    // 環境変数からポートを取得
    const PORT = process.env.PORT || "8080";

    console.log(`Using port: ${PORT}`);
    console.log(`Environment: ${process.env.NODE_ENV || "development"}`);

    // サーバをバインドして起動
    server.bindAsync(
      `0.0.0.0:${PORT}`,
      grpc.ServerCredentials.createInsecure(),
      (err, port) => {
        if (err) {
          console.error("Error binding server:", err);
          process.exit(1);
        }
        console.log(`gRPC server is running on port ${port}`);
        server.start();
      }
    );
  } catch (error: unknown) {
    if (error instanceof Error) {
      console.error("Error starting gRPC server:", error.message);
      console.error("Stack trace:", error.stack);
    } else {
      console.error("Unknown error occurred:", error);
    }
    process.exit(1);
  }
};

// サーバを起動
startServer();
