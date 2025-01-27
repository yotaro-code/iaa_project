import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";

// Protoファイルのパス
const PROTO_PATH = "../proto/audio_service.proto";

// Protoファイルをロード
const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});
const proto = grpc.loadPackageDefinition(packageDefinition) as any;

// AudioServiceのクライアントを作成
const client = new proto.audio.AudioService(
  "localhost:8080",
  grpc.credentials.createInsecure()
);

// テスト用のデータ
const testInitializeRequest = {
  agentId: "junior_engineer",
  userId: "user-abc",
};

// InitializeSessionメソッドを呼び出す
client.InitializeSession(testInitializeRequest, (error: any, response: any) => {
  if (error) {
    console.error("Error:", error);
  } else {
    console.log("InitializeSession Response:", response);

    // 次に ProcessAudio を呼び出す例
    const testProcessAudioRequest = {
      sessionId: response.sessionId,
      agentId: "junior_engineer",
      userId: "user-abc",
      currentRound: 1,
      audioData: Buffer.from("dummy-audio-data"),
    };

    client.ProcessAudio(testProcessAudioRequest, (error: any, response: any) => {
      if (error) {
        console.error("Error:", error);
      } else {
        console.log("ProcessAudio Response:", response);
      }
    });
  }
});
