import 'dart:async';
import 'dart:typed_data';
import '../models/session_response_model.dart';
import '../services/grpc_service.dart';
import '../generated/audio.pbgrpc.dart';

class InterviewRepository {
  final GrpcService _grpcService;

  InterviewRepository(this._grpcService);

  /// **セッションの初期化リクエストを送信し、音声データをストリームで受信**
  Stream<SessionResponse> initializeSession({
    required String agentId,
    required String userId,
  }) async* {
    try {
      final responseStream = _grpcService.initializeSession(
        agentId: agentId,
        userId: userId,
      );

      await for (final response in responseStream) {
        yield SessionResponse(
          sessionId: response.sessionId,
          audioData: Uint8List.fromList(response.initialAudioData),
        );
      }
    } catch (e) {
      throw Exception('Failed to initialize session: $e');
    }
  }

  /// **音声データをリアルタイムで送信し、サーバーのレスポンスをストリームで受け取る**
  Stream<Uint8List> sendAudioData({
    required String sessionId,
    required String agentId,
    required String userId,
    required int currentRound,
    required Stream<Uint8List> audioStream, // マイクからの音声ストリーム
  }) async* {
    try {
      final responseStream = _grpcService.sendAudio(
        sessionId: sessionId,
        agentId: agentId,
        userId: userId,
        currentRound: currentRound,
        audioStream: audioStream,
      );

      await for (final audioData in responseStream) {
        yield audioData; // 受信した音声データをそのまま返す
      }
    } catch (e) {
      throw Exception('Failed to send audio to server: $e');
    }
  }
}
