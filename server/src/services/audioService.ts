import * as grpc from "@grpc/grpc-js";
import { v4 as uuidv4 } from "uuid";
import { synthesizeSpeech } from "./textToSpeechService";
import { convertSpeechToTextStream } from "./speechToTextService";
import { getAgentSpeechConfig, getAgentData, saveSessionData, getSessionData } from "./firestoreService";
import { generatePrompt } from "./vertexAIService";
import { PassThrough } from "stream";

/**
 * InitializeSession: セッションの初期化（ストリーム対応）
 */
export const initializeSession = async (
  call: grpc.ServerWritableStream<any, any>
): Promise<void> => {
  try {
    const { agentId, userId } = call.request;
    const sessionId = uuidv4();

    // 初回の質問を生成
    const initialPrompt = `こんにちは。面接を始めます。回答は1分以内にお願いします。まずは、自己紹介をお願いします。`;

    // Firestoreから音声設定を取得
    console.log("Fetching text-to-speech config for the agent...");
    const rawTtsConfig = await getAgentSpeechConfig(agentId);

    const ttsConfig = {
      ssmlGender: mapSsmlGender(rawTtsConfig.ssmlGender),
      name: rawTtsConfig.name,
      speakingRate: rawTtsConfig.speakingRate,
      pitch: rawTtsConfig.pitch,
    };
    
    console.log("Processed text-to-speech config:", ttsConfig);

    // 初回の音声を合成
    const initialAudio = await synthesizeSpeech(initialPrompt, ttsConfig);

    // Firestoreにセッションデータを保存
    await saveSessionData(sessionId, agentId, userId, 1, [
      { role: "interviewer", message: initialPrompt },
    ]);

    // ストリームでレスポンス送信
    call.write({ sessionId, initialAudioData: initialAudio });
    call.end(); // ストリームを閉じる
  } catch (error) {
    console.error("Error initializing session:", error);
    call.destroy();
  }
};

/**
 * ProcessAudio: 音声データをストリームで処理
 */
export const processAudio = async (call: grpc.ServerDuplexStream<any, any>): Promise<void> => {
  try {
    let sessionId: string = "";
    let agentId: string = "";
    let userId: string = "";
    let currentRound: number = 0;
    let firstChunkReceived = false; // 初回のデータを処理済みかどうか

    const audioStream = new PassThrough();
    console.log("🟠 [DEBUG] Creating audioStream (PassThrough) for STT");

    const textPromise = convertSpeechToTextStream(audioStream); // STTの非同期処理を開始
    console.log("🟠 [DEBUG] convertSpeechToTextStream called");

    call.on("data", (request) => {
      if (!sessionId) {
        sessionId = request.sessionId;
        agentId = request.agentId;
        userId = request.userId;
        currentRound = request.currentRound;
        firstChunkReceived = true;

        console.log(`🔵 [RECEIVE] Start processing sessionId: ${sessionId}, agentId: ${agentId}, userId: ${userId}, currentRound: ${currentRound}`);
      }
    
      if (request.audioData) {
        console.log(`🟡 [RECEIVE] Received audio chunk - Size: ${request.audioData.length} bytes`);
        console.log(`🟡 [RECEIVE] Chunk Preview (hex): ${request.audioData.slice(0, 10).toString("hex")}`);

        // `audioData` のみを STT に送信
        audioStream.write(request.audioData);
        console.log(`🟢 [STREAM] Sent chunk to STT - Size: ${request.audioData.length} bytes`);
      }
    });

    call.on("end", async () => {
      try {
        console.log("🟠 [END] Received all chunks. Closing stream.");
        audioStream.end(); // ストリームの終了を明示
        console.log("Streaming audio received completely, processing text...");

        // リアルタイムで受信していた変換結果を取得
        const userText = await textPromise;
        console.log(`🔴 [FINAL] Final transcription: ${userText}`);

        // Firestoreから過去の会話履歴を取得
        const sessionData = await getSessionData(sessionId);
        const conversationHistory = sessionData?.conversationHistory || [];

        // Firestoreにユーザの発言を保存
        conversationHistory.push({ role: "interviewee", message: userText });

        await saveSessionData(sessionId, agentId, userId, currentRound + 1, conversationHistory);

        // Firestoreからエージェントデータを取得
        const agentData = await getAgentData(agentId);
        if (!agentData) {
          throw new Error(`Agent data not found for agentId: ${agentId}`);
        }

        const maxRounds = agentData.maxRounds || 6;
        const promptType: "interview" | "feedback" = currentRound === maxRounds ? "feedback" : "interview";

        // Geminiで次の質問またはフィードバックを生成
        const nextPrompt = await generatePrompt(agentId, conversationHistory, userText, currentRound, promptType);

        // Firestoreから音声設定を取得
        const rawTtsConfig = await getAgentSpeechConfig(agentId);
        const ttsConfig = {
          ssmlGender: mapSsmlGender(rawTtsConfig.ssmlGender),
          name: rawTtsConfig.name,
          speakingRate: rawTtsConfig.speakingRate,
          pitch: rawTtsConfig.pitch,
        };

        // 次の質問・フィードバックを、音声化&テキスト保存
        let audioResponse: Buffer;

        if (promptType === "feedback") {
          try {
            // 不要な文字列を削除する
            const sanitizedPrompt = nextPrompt
            .replace(/```json/g, "") // ` ```json ` を削除
            .replace(/```/g, "") // ` ``` ` を削除
            .trim();

            const feedback = JSON.parse(sanitizedPrompt);

            if (
              feedback.feedback &&
              feedback.feedback.good_points &&
              feedback.feedback.good_points.detailed &&
              feedback.feedback.good_points.summary &&
              feedback.feedback.improvement_points &&
              feedback.feedback.improvement_points.detailed &&
              feedback.feedback.improvement_points.summary &&
              typeof feedback.feedback.evaluationScore === "number" &&
              feedback.feedback.evaluationReason &&
              feedback.feedback.passOrFail &&
              feedback.feedback.reason
            ) {
              const speechText = `では面接を終了します。これからフィードバックいたします。よかった点。${feedback.feedback.good_points.summary}。改善点。${feedback.feedback.improvement_points.summary}。`;

              // フィードバック音声化
              audioResponse = await synthesizeSpeech(speechText, ttsConfig);

              // Firestoreにフィードバック情報を保存
              const feedbackData = {
                good_points_detailed: feedback.feedback.good_points.detailed,
                good_points_summary: feedback.feedback.good_points.summary,
                improvement_points_detailed: feedback.feedback.improvement_points.detailed,
                improvement_points_summary: feedback.feedback.improvement_points.summary,
                evaluationScore: feedback.feedback.evaluationScore,
                evaluationReason: feedback.feedback.evaluationReason,
                passOrFail: feedback.feedback.passOrFail,
                reason: feedback.feedback.reason,
              };
              console.log("Saving feedback to Firestore...", feedbackData);
              // `saveSessionData`にフィードバックデータを追加して保存
              await saveSessionData(
                sessionId,
                agentId,
                userId,
                currentRound + 1,
                conversationHistory,
                feedbackData // フィードバックデータを渡す
              );
            } else {
              throw new Error("Invalid feedback format.");
            }
          } catch (error) {
            console.error("Error processing feedback JSON:", error);
            throw new Error("Failed to process feedback data.");
          }
        } else { 
          // 次の質問の音声化
          audioResponse = await synthesizeSpeech(nextPrompt, ttsConfig);

          // 通常の処理: 面接官の次の質問を追加して保存
          conversationHistory.push({ role: "interviewer", message: nextPrompt });
          await saveSessionData(sessionId, agentId, userId, currentRound + 1, conversationHistory);
          console.log("Conversation history saved successfully.");
        }

        // ストリームで音声レスポンスを送信
        call.write({ audioData: audioResponse });

        console.log("Streaming response sent successfully.");
        call.end();
      } catch (error) {
        console.error("Error processing audio:", error);
        call.destroy();
      }
    });

    // STTの結果を待つ
    const transcribedText = await textPromise;
    console.log(`🔴 [STT FINAL] Transcription result: "${transcribedText}"`);

    // ストリームエラー処理
    call.on("error", (error) => {
      console.error("❌ [ERROR] Streaming error:", error);
      call.destroy(error);
    });
  } catch (error) {
    console.error("❌ [ERROR] processAudio failed:", error);
    call.destroy();
  }
};


/**
 * ssmlGender を変換するヘルパー関数
 */
import { protos } from "@google-cloud/text-to-speech";
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
