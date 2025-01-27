import { TextToSpeechClient, protos } from "@google-cloud/text-to-speech";

// Text-to-Speechクライアントの初期化
const client = new TextToSpeechClient();

/**
 * テキストを音声データに変換
 * @param text 音声に変換するテキスト
 * @param ttsConfig 音声設定
 * @returns 生成された音声データ（Buffer形式）
 */
export const synthesizeSpeech = async (
  text: string,
  ttsConfig: {
    ssmlGender?: protos.google.cloud.texttospeech.v1.SsmlVoiceGender;
    name?: string;
    speakingRate?: number;
    pitch?: number;
  }
): Promise<Buffer> => {
  try {
    // Text-to-Speech APIのリクエスト構造を定義
    const request: protos.google.cloud.texttospeech.v1.ISynthesizeSpeechRequest = {
      input: { text }, // テキスト入力
      voice: {
        languageCode: "ja-JP", // 日本語
        ssmlGender: ttsConfig.ssmlGender,
        name: ttsConfig.name,
      },
      audioConfig: {
        audioEncoding: protos.google.cloud.texttospeech.v1.AudioEncoding.MP3, // 音声形式
        speakingRate: ttsConfig.speakingRate,
        pitch: ttsConfig.pitch,
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

// ssmlGenderを変換するヘルパー関数
const mapSsmlGender = (gender: string): protos.google.cloud.texttospeech.v1.SsmlVoiceGender => {
  switch (gender.toUpperCase()) {
    case "MALE":
      return protos.google.cloud.texttospeech.v1.SsmlVoiceGender.MALE;
    case "FEMALE":
      return protos.google.cloud.texttospeech.v1.SsmlVoiceGender.FEMALE;
    case "NEUTRAL":
    default:
      return protos.google.cloud.texttospeech.v1.SsmlVoiceGender.NEUTRAL;
  }
};
