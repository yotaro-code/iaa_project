import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:interview_agents_ai/services/audio_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';
import '../models/interview_model.dart';
import '../viewmodels/interview_view_model.dart';
import '../viewmodels/agent_viewmodel.dart';

class InterviewPage extends ConsumerStatefulWidget {
  final String agentId;

  const InterviewPage({required this.agentId, Key? key}) : super(key: key);

  @override
  ConsumerState<InterviewPage> createState() => _InterviewPageState();
}

class _InterviewPageState extends ConsumerState<InterviewPage>
    with SingleTickerProviderStateMixin {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationController;
  double _opacity = 0.8; // 初期値は0.8
  StreamSubscription<Uint8List>? _audioStreamSubscription;

  bool _isFinalRound = false;
  String? _finalSessionId;

  @override
  void initState() {
    super.initState();

    // 再生完了時のリスナー
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        final viewModelNotifier =
            ref.read(interviewViewModelProvider(widget.agentId).notifier);
        viewModelNotifier.updateState(
            isAgentSpeaking: false, isRecording: false, isRequesting: false);

        if (playerState.processingState == ProcessingState.completed) {
          // ここでStateが持っている最終ラウンドフラグを確認
          if (_isFinalRound && _finalSessionId != null) {
            // 最終ラウンドがtrueなら画面遷移
            context.go('/agents/feedback/${widget.agentId}/$_finalSessionId');
          }
        }
      }
    });

    // アニメーションコントローラーの初期化
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {
          _opacity = 0.5 + (0.5 * _animationController.value);
        });
      });
    _animationController.repeat(reverse: true);

    // 初期化処理を実行
    Future.microtask(() {
      final viewModelNotifier =
          ref.read(interviewViewModelProvider(widget.agentId).notifier);

      viewModelNotifier.initializeSession();

      // サーバーからの音声ストリームを購読し、リアルタイム再生
      _audioStreamSubscription =
          viewModelNotifier.responseAudioStream.listen((audioData) async {
        await _playAudio(audioData);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _recorder.dispose();
    _audioPlayer.dispose();
    _audioStreamSubscription?.cancel();
    super.dispose();
  }

  /// **音声をメモリから直接再生 (ストリーム対応)**
  Future<void> _playAudio(Uint8List audioData) async {
    try {
      final viewModelNotifier =
          ref.read(interviewViewModelProvider(widget.agentId).notifier);
      viewModelNotifier.updateState(isAgentSpeaking: true);

      await _audioPlayer.setAudioSource(MemoryAudioSource(audioData));
      await _audioPlayer.play();
    } catch (e) {
      print('音声再生中にエラーが発生しました: $e');
    }
  }

  /// **録音開始 (ストリームで送信)**
  Future<void> startRecording(maxRounds) async {
    try {
      if (await _recorder.hasPermission()) {
        final viewModelNotifier =
            ref.read(interviewViewModelProvider(widget.agentId).notifier);

        // gRPC の音声ストリーム開始
        viewModelNotifier.startAudioStream(
            agentId: widget.agentId, maxRounds: maxRounds);

        // `startStream()` を使用してストリームをリッスン（16kHz, 1チャンネル）
        final stream = await _recorder.startStream(
          const RecordConfig(
            encoder: AudioEncoder.pcm16bits, // PCM 16bit エンコーダー
            sampleRate: 16000, // サンプリングレートを 16kHz に設定
            numChannels: 1, // 1チャンネル（モノラル）
          ),
        );

        stream.listen((audioData) {
          viewModelNotifier.sendAudioChunk(Uint8List.fromList(audioData));
        });

        viewModelNotifier.updateState(isRecording: true);
      } else {
        print('録音の権限がありません');
      }
    } catch (e) {
      print('録音開始中にエラーが発生しました: $e');
    }
  }

  /// **録音を停止**
  Future<void> stopRecording() async {
    try {
      await _recorder.stop();
      final viewModelNotifier =
          ref.read(interviewViewModelProvider(widget.agentId).notifier);

      viewModelNotifier.endAudioStream(); // ストリーム終了を通知

      viewModelNotifier.updateState(
          isAgentSpeaking: false, isRecording: false, isRequesting: true);
    } catch (e) {
      print('録音停止中にエラーが発生しました: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(interviewViewModelProvider(widget.agentId));

    _isFinalRound = viewModel.isFinalRound;
    _finalSessionId = viewModel.sessionId;

    final agentAsyncValue = ref.watch(agentViewModelProvider);

    return agentAsyncValue.when(
      data: (agents) {
        final agent = agents.firstWhere((a) => a.agentId == widget.agentId);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Interview'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0), // 左右に16pxの余白を追加
                  child: Text(
                    agent.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 220,
                  height: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (viewModel.isAgentSpeaking &&
                          !viewModel.isRecording &&
                          !viewModel.isRequesting)
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Container(
                              width: 200 + (_animationController.value * 20),
                              height: 200 + (_animationController.value * 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.withOpacity(
                                    0.3 * (1 - _animationController.value)),
                              ),
                            );
                          },
                        ),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: (!viewModel.isAgentSpeaking &&
                                !viewModel.isRecording &&
                                viewModel.isRequesting)
                            ? _opacity
                            : 1.0,
                        child: ClipOval(
                          child: Container(
                            color: Colors.white, // 背景を白に設定
                            width: 200, // 直径
                            height: 200, // 直径
                            child: FittedBox(
                              fit: BoxFit.contain, // 画像が枠内に収まるように調整
                              child: Image.network(
                                agent.imageUrl ??
                                    'https://via.placeholder.com/80',
                                width: 200, // 直径
                                height: 200, // 直径
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 220,
                  height: 220,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (!viewModel.isAgentSpeaking &&
                          viewModel.isRecording &&
                          !viewModel.isRequesting)
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return Container(
                              width: 80 + (_animationController.value * 10),
                              height: 80 + (_animationController.value * 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red.withOpacity(
                                    0.3 * (1 - _animationController.value)),
                              ),
                            );
                          },
                        ),
                      ElevatedButton(
                        onPressed: () async {
                          if (viewModel.isRecording) {
                            await stopRecording();
                          } else if (!viewModel.isAgentSpeaking &&
                              !viewModel.isRequesting) {
                            await startRecording(agent.maxRounds);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20),
                          backgroundColor: viewModel.isRecording
                              ? Colors.red
                              : (!viewModel.isAgentSpeaking &&
                                      !viewModel.isRequesting)
                                  ? Colors.green
                                  : Colors.grey,
                        ),
                        child: Icon(
                          viewModel.isRecording ? Icons.stop : Icons.mic,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}
