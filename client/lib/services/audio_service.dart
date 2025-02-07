import 'package:just_audio/just_audio.dart';
import 'dart:typed_data';

/// **音声をメモリから直接ストリーム再生するカスタムオーディオソース**
class MemoryAudioSource extends StreamAudioSource {
  final Uint8List audioData;

  MemoryAudioSource(this.audioData);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= audioData.length;
    return StreamAudioResponse(
      sourceLength: audioData.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(audioData.sublist(start, end)), // ストリーム化
      contentType: 'audio/mpeg', // MIMEタイプ
    );
  }
}
