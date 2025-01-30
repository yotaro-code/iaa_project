import { SpeechClient } from "@google-cloud/speech";
import { protos } from "@google-cloud/speech";

// Speech-to-Textクライアントの初期化
const client = new SpeechClient();

/**
 * 音声データをテキストに変換
 * @param audioData 音声データ（Buffer形式）
 * @returns テキストに変換された文字列
 */
export const convertSpeechToText = async (audioData: Buffer): Promise<string> => {
  try {
    // Speech-to-Text APIのリクエスト構造を定義
    const request: protos.google.cloud.speech.v1.IRecognizeRequest = {
      audio: {
        content: audioData.toString("base64"), // 音声データをBase64形式に変換
      },
      config: {
        encoding: protos.google.cloud.speech.v1.RecognitionConfig.AudioEncoding.LINEAR16, // 型を明示
        sampleRateHertz: 16000,
        languageCode: "ja-JP", // 日本語で変換
      },
    };

    // リクエストの詳細をログに出力
    console.log("Speech-to-Text API Request Config:", JSON.stringify(request.config, null, 2));
    console.log("Audio Data Length (Base64):", request.audio?.content?.length);

    // Speech-to-Text APIを呼び出して音声をテキストに変換
    const [response] = await client.recognize(request);

    // APIの結果をログに出力
    console.log("Speech-to-Text API Response:", JSON.stringify(response, null, 2));

    // APIの結果からテキストを抽出
    const transcription = response.results
      ?.map((result) => result.alternatives?.[0]?.transcript || "")
      .join(" ");

    if (!transcription) {
      console.error("No transcription found in response.");
      throw new Error("Failed to transcribe audio");
    }

    console.log("Transcription Result:", transcription);

    return transcription;
  } catch (error) {
    // エラー時の詳細ログを出力
    console.error("Error converting speech to text:");
    console.error("Error Message:", error || error);

    throw new Error("Speech-to-Text processing failed");
  }
};