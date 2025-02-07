import 'dart:async';
import 'dart:typed_data';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import '../models/interview_model.dart';
import '../repositories/repository_providers.dart';

part 'interview_view_model.g.dart';

@riverpod
class InterviewViewModel extends _$InterviewViewModel {
  StreamController<Uint8List>? _recordingStreamController;
  StreamController<Uint8List>? _responseStreamController;

  @override
  InterviewState build(String agentId) {
    _recordingStreamController = StreamController<Uint8List>.broadcast();
    _responseStreamController = StreamController<Uint8List>.broadcast();

    return InterviewState(
      sessionId: '',
      userId: const Uuid().v4(),
      agentId: agentId,
      isAgentSpeaking: false,
      isRecording: false,
      isRequesting: true,
      currentRound: 1,
      isFinalRound: false,
      requestAudioData: null,
      responseAudioData: null,
    );
  }

  Stream<Uint8List> get responseAudioStream =>
      _responseStreamController!.stream;

  /// **セッションを初期化し、サーバーから初回音声データをリアルタイムで受信**
  Future<void> initializeSession() async {
    final repository = ref.read(interviewRepositoryProvider);

    try {
      final responseStream = repository.initializeSession(
        agentId: state.agentId,
        userId: state.userId,
      );

      bool isFirstResponse = true;

      await for (final response in responseStream) {
        state = state.copyWith(
          sessionId: response.sessionId,
          isRequesting: false,
          responseAudioData: response.audioData,
        );

        _responseStreamController?.add(response.audioData);

        isFirstResponse = false;
      }
    } catch (e) {
      throw Exception('セッション初期化中にエラーが発生しました: $e');
    }
  }

  /// **音声ストリームを開始し、サーバーにリアルタイム送信**
  void startAudioStream({required String agentId, required int maxRounds}) {
    // 既存のストリームがある場合は閉じる
    _recordingStreamController?.close();

    // **新しい StreamController を作成**
    _recordingStreamController = StreamController<Uint8List>();

    final repository = ref.read(interviewRepositoryProvider);

    final responseStream = repository.sendAudioData(
      sessionId: state.sessionId,
      agentId: agentId,
      userId: state.userId,
      currentRound: state.currentRound,
      audioStream: _recordingStreamController!.stream,
    );

    responseStream.listen(
      (audioData) {
        _responseStreamController?.add(audioData);

        state = state.copyWith(
          responseAudioData: audioData,
        );
      },
      onDone: () {
        final nextRound = state.currentRound + 1;
        state = state.copyWith(
          currentRound: nextRound,
          isFinalRound: nextRound > maxRounds, // maxRoundsで最終ラウンド判定
        );
        print("サーバーのレスポンスストリームが完了しました！");
      },
    );
  }

  /// **録音したデータをストリームで送信**
  void sendAudioChunk(Uint8List audioData) {
    _recordingStreamController?.add(audioData);
  }

  /// **録音したデータをストリームを終了**
  void endAudioStream() {
    print("サーバーへの音声ストリーム送信を終了します");
    _recordingStreamController?.close(); // **ストリームを閉じる**
    _recordingStreamController = null; // **次の録音のために `null` にする**
  }

  /// **状態を更新**
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

  /// **録音開始**
  void startRecording() {
    state = state.copyWith(isRecording: true);
  }

  /// **録音停止**
  void stopRecording() {
    state = state.copyWith(isRecording: false);
  }
}
