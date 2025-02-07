import 'dart:async';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';
import '../generated/audio.pbgrpc.dart';

class GrpcService {
  final ClientChannel _channel;

  GrpcService(String grpcEndpoint)
      : _channel = ClientChannel(
          grpcEndpoint,
          port: 443, // gRPCサーバーのポート番号
          options: const ChannelOptions(
            credentials: ChannelCredentials.secure(), // 必要に応じてセキュアな認証情報を設定
          ),
        );

  /// セッションの初期化リクエストを送信し、ストリームの最初のレスポンスを取得
  /// セッションの初期化リクエストを送信し、音声データをストリームで受信
  Stream<InitializeResponse> initializeSession({
    required String agentId,
    required String userId,
  }) async* {
    final client = AudioServiceClient(_channel);
    final request = InitializeRequest(agentId: agentId, userId: userId);

    try {
      // サーバーからのレスポンスをストリームで受信
      final responseStream = client.initializeSession(request);

      // ストリームを順次処理して返す
      await for (final response in responseStream) {
        yield response; // 受信した音声データをそのままストリームで View に流す
      }
    } catch (e) {
      throw Exception('Failed to initialize session: $e');
    }
  }

  /// 音声データをリアルタイムでストリーム送信し、ストリームでレスポンスを受け取る
  Stream<Uint8List> sendAudio({
    required String sessionId,
    required String agentId,
    required String userId,
    required int currentRound,
    required Stream<Uint8List> audioStream,
  }) async* {
    final client = AudioServiceClient(_channel);
    final requestStream = StreamController<AudioRequest>();

    // マイクからの音声ストリームを gRPC サーバーに送信
    audioStream.listen((audioData) {
      final request = AudioRequest(
        sessionId: sessionId,
        agentId: agentId,
        userId: userId,
        currentRound: currentRound,
        audioData: audioData,
      );

      print('ストリーム送信中');

      requestStream.sink.add(request);
    }, onDone: () {
      print('ストリーム送信完了');
      requestStream.close();
    });

    try {
      // サーバーからのレスポンスをストリームで受け取る
      final responseStream = client.processAudio(requestStream.stream);

      await for (final response in responseStream) {
        yield Uint8List.fromList(response.audioData); // 音声データをリアルタイムで返す
      }
    } catch (e) {
      throw Exception('Failed to send audio to server: $e');
    }
  }

  /// gRPCチャネルのシャットダウン
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
