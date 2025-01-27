import * as grpc from "@grpc/grpc-js";
import * as fs from "fs";
import { loadProto } from "../utils/protoSpeechToTextLoader";
import path from "path";

const PROTO_PATH = path.join(__dirname, "../../protos/speech.proto");

// gRPCクライアントの初期化
const SpeechProto = loadProto(PROTO_PATH) as any;
const client = new SpeechProto.google.cloud.speech.v1.Speech(
  "speech.googleapis.com:443",
  grpc.credentials.createSsl()
);

/**
 * 音声データをテキストに変換
 * @param audioPath 音声ファイルパス
 * @returns テキストに変換された文字列
 */
export const convertSpeechToText = async (audioPath: string): Promise<string> => {
  try {
    // 音声データを読み込む
    const audioData = fs.readFileSync(audioPath);

    // Speech-to-Text APIのリクエスト構造
    const request = {
      config: {
        encoding: "LINEAR16", // WAV形式の場合
        sampleRateHertz: 16000,
        languageCode: "ja-JP",
      },
      audio: {
        content: audioData, // バイナリデータをそのまま送信
      },
    };

    // gRPCリクエストを送信
    const response = await new Promise<any>((resolve, reject) => {
      client.Recognize(request, (err: Error | null, response: any) => {
        if (err) return reject(err);
        resolve(response);
      });
    });

    // 結果からテキストを抽出
    const transcription = response.results
      ?.map((result: any) => result.alternatives[0]?.transcript || "")
      .join(" ");

    if (!transcription) {
      throw new Error("音声認識に失敗しました");
    }

    console.log("Transcription Result:", transcription);
    return transcription;
  } catch (error) {
    console.error("Error converting speech to text:", error);
    throw new Error("音声認識処理中にエラーが発生しました");
  }
};
