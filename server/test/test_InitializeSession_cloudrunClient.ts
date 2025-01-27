import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import path from "path";

// サーバーのアドレス（Cloud Run のエンドポイント URL に置き換えてください）
const SERVER_ADDRESS = "ai-interview-agents-63162381056.asia-northeast1.run.app:443";

// Protoファイルのパス
const PROTO_PATH = path.join(__dirname, "../proto/audio_service.proto");

// Proto定義を読み込む
const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

// gRPCパッケージを生成
const audioProto = grpc.loadPackageDefinition(packageDefinition) as any;

// AudioServiceのクライアントを作成
const client = new audioProto.audio.AudioService(
  SERVER_ADDRESS,
  grpc.credentials.createSsl() // Cloud Runの場合、SSLを使用
);

// InitializeSessionをテストする関数
const testInitializeSession = () => {
  // InitializeSession用のリクエスト
  const request = {
    agentId: "junior_engineer", // テスト用エージェントID
    userId: "test-user-id",   // テスト用ユーザーID
  };

  // gRPCリクエストを送信
  client.InitializeSession(
    request,
    (err: grpc.ServiceError | null, response: any) => {
      if (err) {
        console.error("Error during InitializeSession gRPC call:", err);
        return;
      }

      // レスポンスを出力
      console.log("Received response from InitializeSession:");
      console.log("Session ID:", response.sessionId);

      // 初回の質問音声データをBase64エンコードで表示
      console.log("Initial Audio Data (Base64):", response.initialAudioData.toString("base64"));

      // 音声データをファイルに保存（任意）
      const fs = require("fs");
      fs.writeFileSync("initial_audio.wav", response.initialAudioData);
      console.log("Initial audio saved as 'initial_audio.wav'");
    }
  );
};

// テストを実行
testInitializeSession();
