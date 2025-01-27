import { TextToSpeechClient } from "@google-cloud/text-to-speech";
import { protos } from "@google-cloud/text-to-speech";

// Text-to-Speechクライアントの初期化
const client = new TextToSpeechClient();

/**
 * テキストを音声データに変換
 * @param text 音声に変換するテキスト
 * @returns 生成された音声データ（Buffer形式）
 */
export const synthesizeSpeech = async (text: string): Promise<Buffer> => {
  try {
    // Text-to-Speech APIのリクエスト構造を定義
    const request: protos.google.cloud.texttospeech.v1.ISynthesizeSpeechRequest = {
      input: { text }, // テキスト入力
      voice: {
        languageCode: "ja-JP", // 日本語
        ssmlGender: protos.google.cloud.texttospeech.v1.SsmlVoiceGender.NEUTRAL, // 中立的な声
        name: 'ja-JP-Wavenet-C', // Specify a specific voice model
      },
      audioConfig: {
        audioEncoding: protos.google.cloud.texttospeech.v1.AudioEncoding.MP3, // 音声形式
        speakingRate: 1.5, // 話す速度
        pitch: 0.0, // 声の高さ
      },
    };

    // Text-to-Speech APIを呼び出してテキストを音声に変換
    const [response] = await client.synthesizeSpeech(request);

    // audioContentがあるか確認し、型をチェック
    if (!response.audioContent || !(response.audioContent instanceof Uint8Array)) {
      throw new Error("Failed to synthesize speech: Invalid audio content");
    }

    // Uint8ArrayをBuffer形式に変換して返す
    return Buffer.from(response.audioContent);
  } catch (error) {
    console.error("Error processing text-to-speech:", error);
    throw new Error("Text-to-Speech processing failed");
  }
};
