import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../repositories/interview_repository.dart';
import '../models/interview_model.dart';
import '../repositories/repository_providers.dart';

part 'interview_view_model.g.dart';

@riverpod
class InterviewViewModel extends _$InterviewViewModel {
  @override
  InterviewState build(String agentId) {
    return InterviewState(
      sessionId: '', // 初期値を空文字列に設定
      userId: const Uuid().v4(),
      agentId: agentId,
      isAgentSpeaking: false,
      isRecording: false,
      isRequesting: true,
      currentRound: 0,
      isFinalRound: false,
      requestAudioData: null,
      responseAudioData: null,
    );
  }

  /// セッションを初期化してサーバーから初期音声データを取得
  Future<void> initializeSession() async {
    final repository = ref.read(interviewRepositoryProvider);

    try {
      // サーバーへ初期化リクエストを送信
      final response = await repository.initializeSession(
        agentId: state.agentId,
        userId: state.userId,
      );

      // 状態を更新
      state = state.copyWith(
        sessionId: response.sessionId,
        isRequesting: false,
        responseAudioData:
            Uint8List.fromList(response.initialAudioData), // 初期音声データ
      );
    } catch (e) {
      throw Exception('セッション初期化中にエラーが発生しました: $e');
    }
  }

  /// 状態を更新するヘルパーメソッド
  void updateState({
    bool? isAgentSpeaking,
    bool? isRecording,
    bool? isRequesting,
    int? currentRound,
    bool? isFinalRound,
    Uint8List? requestAudioData,
    Uint8List? responseAudioData,
  }) {
    state = state.copyWith(
      isAgentSpeaking: isAgentSpeaking ?? state.isAgentSpeaking,
      isRecording: isRecording ?? state.isRecording,
      isRequesting: isRequesting ?? state.isRequesting,
      currentRound: currentRound ?? state.currentRound,
      isFinalRound: isFinalRound ?? state.isFinalRound,
      requestAudioData: requestAudioData ?? state.requestAudioData,
      responseAudioData: responseAudioData ?? state.responseAudioData,
    );
  }

  /// サーバーから音声データを取得
  Future<void> fetchServerAudio() async {
    state = state.copyWith(isAgentSpeaking: true);
    print('isAgentSpeaking: ${state.isAgentSpeaking}');

    final repository = ref.read(interviewRepositoryProvider);

    try {
      final audioData = await repository.sendAudioData(
        sessionId: state.sessionId,
        agentId: state.agentId,
        userId: state.userId,
        currentRound: state.currentRound,
      );

      state = state.copyWith(
        //isAgentSpeaking: false,
        responseAudioData: Uint8List.fromList(audioData), // サーバーからの音声データを格納
      );
    } catch (e) {
      state = state.copyWith(isAgentSpeaking: false);
      throw Exception('サーバー音声取得中にエラーが発生しました: $e');
    }
  }

  /// ユーザーの音声データをサーバーに送信
  Future<void> sendAudio(Uint8List audioData, int maxRounds) async {
    state = state.copyWith(
      isRecording: false,
      requestAudioData: audioData, // 録音したデータを格納
    );

    print('audioData');
    print(audioData.runtimeType);
    print(audioData);

    print('Audio Data Length: ${audioData.length}');
    print('Audio Data Preview: ${audioData.sublist(0, 20)}');

    final repository = ref.read(interviewRepositoryProvider);

    try {
      final serverAudioData = await repository.sendAudioData(
        sessionId: state.sessionId,
        agentId: state.agentId,
        userId: state.userId,
        currentRound: state.currentRound,
        audioData: audioData,
      );

      final nextRound = state.currentRound + 1;

      state = state.copyWith(
        currentRound: nextRound,
        responseAudioData:
            Uint8List.fromList(serverAudioData), // サーバーからの音声データを格納
        isFinalRound: nextRound > maxRounds, // maxRoundsで最終ラウンド判定
      );
    } catch (e) {
      throw Exception('音声送信中にエラーが発生しました: $e');
    }
  }

  /// 録音開始
  void startRecording() {
    state = state.copyWith(isRecording: true);
  }

  /// 録音停止
  void stopRecording() {
    state = state.copyWith(isRecording: false);
  }
}
