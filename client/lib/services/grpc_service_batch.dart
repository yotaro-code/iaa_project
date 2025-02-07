import 'dart:io';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';
import 'package:interview_agents_ai/generated/audio_batch.pbgrpc.dart';

import 'package:path_provider/path_provider.dart';

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

  /// セッションの初期化リクエストを送信し、セッションIDと初回音声データを取得
  Future<InitializeResponse> initializeSession({
    required String agentId,
    required String userId,
  }) async {
    final client = AudioServiceClient(_channel);

    print(client);

    final request = InitializeRequest(
      agentId: agentId,
      userId: userId,
    );

    print(request);

    try {
      // 初期化リクエストを送信
      final response = await client.initializeSession(request);

      print(response);

      // 初期化レスポンス（セッションIDと初回音声データ）を返す
      return response;
    } catch (e) {
      throw Exception('Failed to initialize session: $e');
    }
  }

  /// 音声データをサーバーに送信し、レスポンスの音声データを取得
  Future<Uint8List> sendAudio({
    required String sessionId,
    required String agentId,
    required String userId,
    required int currentRound,
    Uint8List? audioData,
  }) async {
    print('Sending audio data...');
    print('Audio Data Type: ${audioData.runtimeType}');
    print('Audio Data Length: ${audioData?.length}');
    print('Audio Data Sample: ${audioData?.sublist(0, 10)}'); // 一部を表示

    final client = AudioServiceClient(_channel);

    final request = AudioRequest(
      sessionId: sessionId,
      agentId: agentId,
      userId: userId,
      currentRound: currentRound,
      audioData: audioData ?? Uint8List(0), // デフォルト値を空のバイト配列に設定
    );

    try {
      // 音声データリクエストを送信し、レスポンスを取得
      final response = await client.processAudio(request);

      // サーバーから返された音声データ（List<int>）をUint8Listに変換
      final audioData = Uint8List.fromList(response.audioData);

      // // デバッグ用：保存用のファイルパスを取得
      // final tempDir = await getTemporaryDirectory();
      // final filePath = '${tempDir.path}/response_audio.wav';
      // print(filePath);

      // // デバッグ用：音声データをファイルに保存
      // final file = File(filePath);
      // await file.writeAsBytes(audioData);

      // // 保存されたファイルパスをログに出力
      // print('Audio data saved to: $filePath');

      // 保存後の音声データを返す
      return audioData;
    } catch (e) {
      throw Exception('Failed to send audio to server: $e');
    }
  }

  /// gRPCチャネルのシャットダウン
  Future<void> shutdown() async {
    await _channel.shutdown();
  }
}
