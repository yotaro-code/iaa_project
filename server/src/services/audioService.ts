import * as grpc from "@grpc/grpc-js";
import { v4 as uuidv4 } from "uuid";
import { synthesizeSpeech } from "./textToSpeechService";
import { convertSpeechToText } from "./speechToTextService";
import { getAgentSpeechConfig, saveSessionData, getSessionData } from "./firestoreService";
import { generatePrompt } from "./vertexAIService";

/**
 * InitializeSession: セッションの初期化
 */
export const initializeSession = async (
  call: grpc.ServerUnaryCall<any, any>,
  callback: grpc.sendUnaryData<any>
): Promise<void> => {
  try {
    const { agentId, userId } = call.request;
    const sessionId = uuidv4();

    // 初回の質問を生成（固定の質問として定義）
    const initialPrompt = `こんにちは。面接を始めます。自己紹介をお願いします。`;

    // Firestoreから音声設定を取得
    console.log("Fetching text-to-speech config for the agent...");
    const rawTtsConfig = await getAgentSpeechConfig(agentId);

      // ssmlGender を列挙型に変換
    const ttsConfig = {
      ssmlGender: mapSsmlGender(rawTtsConfig.ssmlGender),
      name: rawTtsConfig.name,
      speakingRate: rawTtsConfig.speakingRate,
      pitch: rawTtsConfig.pitch,
    };
    console.log("Processed text-to-speech config:", ttsConfig);
    const initialAudio = await synthesizeSpeech(initialPrompt, ttsConfig);

    // Firestoreにセッションデータを保存
    await saveSessionData(sessionId, agentId, userId, 1, [
      { role: "interviewer", message: initialPrompt },
    ]);

    callback(null, { sessionId, initialAudioData: initialAudio });
  } catch (error) {
    console.error("Error initializing session:", error);
    callback({ code: grpc.status.INTERNAL, message: "Failed to initialize session" });
  }
};

/**
 * ProcessAudio: 音声データを処理
 */
export const processAudio = async (
    call: grpc.ServerUnaryCall<any, any>,
    callback: grpc.sendUnaryData<any>
  ): Promise<void> => {
    try {
      const { sessionId, agentId, userId, currentRound, audioData } = call.request;
  
      console.log(`Start processing audio for sessionId: ${sessionId}, agentId: ${agentId}, userId: ${userId}, currentRound: ${currentRound}`);
  
      // 音声をテキストに変換
      console.log("Converting audio to text...");
      const userText = await convertSpeechToText(audioData);
      console.log("Audio successfully converted to text:", userText);
  
      // Firestoreから過去の会話履歴を取得
      console.log("Fetching session data from Firestore...");
      const sessionData = await getSessionData(sessionId);
      const conversationHistory = sessionData?.conversationHistory || [];
      console.log("Fetched session data successfully:", conversationHistory);
  
      // プロンプトタイプを決定
      const promptType: "interview" | "feedback" = currentRound === 3
        ? "feedback" // フィードバック
        : "interview"; // 通常の質問
      console.log(`Determined prompt type: ${promptType}`);
  
      // Geminiで次の質問またはフィードバックを生成
      console.log("Generating next prompt using Vertex AI...");
      const nextPrompt = await generatePrompt(agentId, conversationHistory, userText, currentRound, promptType);
      console.log("Generated next prompt:", nextPrompt);

      // Firestoreから音声設定を取得
      console.log("Fetching text-to-speech config for the agent...");
      const rawTtsConfig = await getAgentSpeechConfig(agentId);

        // ssmlGender を列挙型に変換
      const ttsConfig = {
        ssmlGender: mapSsmlGender(rawTtsConfig.ssmlGender),
        name: rawTtsConfig.name,
        speakingRate: rawTtsConfig.speakingRate,
        pitch: rawTtsConfig.pitch,
      };
      console.log("Processed text-to-speech config:", ttsConfig);


      // 次の質問またはフィードバックを音声化
      console.log("Synthesizing speech for the generated prompt...");

      let audioResponse: Buffer;

      if (promptType === "feedback") {
      // JSON形式のフィードバックを解析して、音声用のテキストを作成
        try {
          // 不要な文字列を削除する
          const sanitizedPrompt = nextPrompt
          .replace(/```json/g, "") // ` ```json ` を削除
          .replace(/```/g, "") // ` ``` ` を削除
          .trim();

          // JSONとしてパース
          const feedback = JSON.parse(sanitizedPrompt); // フィードバック JSON を解析
          if (
            feedback.feedback &&
            feedback.feedback.good_points &&
            feedback.feedback.good_points.summary &&
            feedback.feedback.improvement_points &&
            feedback.feedback.improvement_points.summary
          ) {
            // summary 部分を音声用のテキストに組み立てる
            const speechText = `では面接を終了します。これからフィードバックいたします。よかった点。${feedback.feedback.good_points.summary}。改善点。${feedback.feedback.improvement_points.summary}。`;
            console.log(`Synthesizing speech for feedback: ${speechText}`);
            audioResponse = await synthesizeSpeech(nextPrompt, ttsConfig); // 音声合成を実行
          } else {
            throw new Error("Invalid feedback format in the prompt.");
          }
        } catch (error) {
          console.error("Error parsing feedback JSON or synthesizing speech:", error);
          throw new Error("Failed to process feedback for speech synthesis.");
        }
      } else {
        // 通常の質問をそのまま音声化
        console.log(`Synthesizing speech for interview prompt: ${nextPrompt}`);
        audioResponse = await synthesizeSpeech(nextPrompt, ttsConfig);
      }

      console.log("Speech synthesis completed.");
    
      // Firestoreに新しい会話を保存
      console.log("Saving updated conversation history to Firestore...");

      // 共通処理: ユーザーの発言をconversationHistoryに追加
      conversationHistory.push({ role: "interviewee", message: userText });

      if (promptType === "feedback") {
        // 不要な文字列を削除
        const sanitizedPrompt = nextPrompt
          .replace(/```json/g, "") // ` ```json ` を削除
          .replace(/```/g, "") // ` ``` ` を削除
          .trim();

        try {
          // フィードバックのJSONを解析
          const feedback = JSON.parse(sanitizedPrompt);

          // フィードバックが正しい形式かどうかを確認
          if (
            feedback.feedback &&
            feedback.feedback.good_points &&
            feedback.feedback.good_points.detailed &&
            feedback.feedback.improvement_points &&
            feedback.feedback.improvement_points.detailed
          ) {
            // Firestoreにフィードバック情報を保存
            const feedbackData = {
              good_points_detailed: feedback.feedback.good_points.detailed,
              improvement_points_detailed: feedback.feedback.improvement_points.detailed,
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

            console.log("Feedback saved successfully.");
          } else {
            throw new Error("Invalid feedback format.");
          }
        } catch (error) {
          console.error("Error processing feedback JSON:", error);
          throw new Error("Failed to process feedback data.");
        }
      } else {
        // 通常の処理: 面接官の発言を追加して保存
        conversationHistory.push({ role: "interviewer", message: nextPrompt });
        await saveSessionData(sessionId, agentId, userId, currentRound + 1, conversationHistory);
        console.log("Conversation history saved successfully.");
      }
  
      callback(null, { audioData: audioResponse });
      console.log("ProcessAudio completed successfully for sessionId:", sessionId);
    } catch (error) {
      console.error("Error processing audio:", error);
      callback({ code: grpc.status.INTERNAL, message: "Failed to process audio" });
    }
  };


  import { protos } from "@google-cloud/text-to-speech";

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

