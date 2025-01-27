import 'package:grpc/grpc.dart';

void main() async {
  final channel = ClientChannel(
    'ai-interview-agents-63162381056.asia-northeast1.run.app',
    port: 443,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(), // 必要なら secure に変更
    ),
  );

  try {
    await channel.getConnection();
    print('Connection successful!');
  } catch (e) {
    print('Connection failed: $e');
  } finally {
    await channel.shutdown();
  }
}
