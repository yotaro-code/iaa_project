// import 'dart:typed_data';

// import 'package:interview_agents_ai/services/grpc_service_batch.dart';

// import '../generated/audio.pbgrpc.dart';

// class InterviewRepository {
//   final GrpcService _grpcService;

//   InterviewRepository(this._grpcService);

//   /// セッションの初期化リクエストを送信し、初期化レスポンスを取得
//   Future<InitializeResponse> initializeSession({
//     required String agentId,
//     required String userId,
//   }) async {
//     try {
//       // GrpcServiceを通じて初期化リクエストを送信
//       return await _grpcService.initializeSession(
//         agentId: agentId,
//         userId: userId,
//       );
//     } catch (e) {
//       throw Exception('Failed to initialize session: $e');
//     }
//   }

//   /// 音声データを送信してサーバーのレスポンスを取得
//   Future<Uint8List> sendAudioData({
//     required String sessionId,
//     required String agentId,
//     required String userId,
//     required int currentRound,
//     Uint8List? audioData,
//   }) async {
//     try {
//       // GrpcServiceを通じて音声データを送信
//       return await _grpcService.sendAudio(
//         sessionId: sessionId,
//         agentId: agentId,
//         userId: userId,
//         currentRound: currentRound,
//         audioData: audioData,
//       );
//     } catch (e) {
//       throw Exception('Failed to send audio to server: $e');
//     }
//   }
// }
