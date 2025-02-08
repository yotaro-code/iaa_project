import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import fs from "fs";
import path from "path";

// サーバーのアドレス（Cloud Run のエンドポイント URL に置き換えてください）
const SERVER_ADDRESS = "url";

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

// テスト用の音声データを読み込む（適宜ファイルパスを指定してください）
const audioFilePath = path.join(__dirname, "test_audio_self_16000hz.wav");
const audioData = fs.readFileSync(audioFilePath);

// gRPCリクエストを送信
const testProcessAudio = () => {
  const request = {
    sessionId: "74853285-bf28-4a67-adbb-fb444a0b78bc",
    agentId: "junior_engineer",
    userId: "test-user-id",
    currentRound: 2,
    audioData: audioData, // テスト用の音声データ
  };

  client.ProcessAudio(request, (err: grpc.ServiceError | null, response: any) => {
    if (err) {
      console.error("Error during gRPC call:", err);
      return;
    }

    // レスポンスを出力
    console.log("Received response from ProcessAudio:");
    console.log("Audio Data (Base64):", response.audioData.toString("base64"));

    // レスポンスの音声データをファイルに保存（任意）
    fs.writeFileSync("response_audio.wav", response.audioData);
    console.log("Audio response saved as 'response_audio.wav'");
  });
};

// テストを実行
testProcessAudio();
