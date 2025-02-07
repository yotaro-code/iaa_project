import { SpeechClient } from "@google-cloud/speech";
import { protos } from "@google-cloud/speech";

// Speech-to-Textクライアントの初期化
const client = new SpeechClient();

/**
 * 音声データをストリームでテキストに変換
 * @param audioStream ストリーム化された音声データ（BufferのReadableStream）
 * @returns リアルタイムで受信するテキストのPromise
 */
export const convertSpeechToTextStream = (audioStream: NodeJS.ReadableStream): Promise<string> => {
  return new Promise((resolve, reject) => {
    let finalTranscription = "";

    console.log("🟠 [STT] Initializing Speech-to-Text stream...");

    const recognizeStream = client.streamingRecognize({
      config: {
        encoding: protos.google.cloud.speech.v1.RecognitionConfig.AudioEncoding.LINEAR16,
        sampleRateHertz: 16000,
        languageCode: "ja-JP",
      },
      interimResults: true, // 途中結果も取得 (ただし最終結果のみ使う)
    });

    recognizeStream
      .on("error", (error) => {
        console.error("❌ [STT ERROR] Speech-to-Text Stream Error:", error);
        reject(error);
      })
      .on("data", (data) => {
        if (data.results && data.results[0] && data.results[0].alternatives[0]) {
          const resultText = data.results[0].alternatives[0].transcript;
          const isFinal = data.results[0].isFinal; // 最終結果かどうかのフラグ

          if (isFinal) {
            finalTranscription = resultText; // 途中結果を蓄積せず、最終結果だけを保存
            console.log(`🔴 [STT FINAL] Final transcription updated: "${finalTranscription}"`);
          } else {
            console.log(`🟢 [STT PARTIAL] Partial transcription: "${resultText}"`);
          }
        }
      })
      .on("end", () => {
        console.log(`🔴 [STT FINAL] Transcription result: "${finalTranscription}"`);
        resolve(finalTranscription.trim());
      });

    console.log("🟡 [STT] Connecting audio stream to STT...");

    // **手動で write せずに、pipe でデータを流す**
    audioStream.pipe(recognizeStream);
  });
};




