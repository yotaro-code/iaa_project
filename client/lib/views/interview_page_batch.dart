// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:interview_agents_ai/models/interview_model.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';
// import 'package:just_audio/just_audio.dart';
// import '../viewmodels/interview_view_model.dart';
// import '../viewmodels/agent_viewmodel.dart';

// class InterviewPage extends ConsumerStatefulWidget {
//   final String agentId;

//   const InterviewPage({required this.agentId, Key? key}) : super(key: key);

//   @override
//   ConsumerState<InterviewPage> createState() => _InterviewPageState();
// }

// class _InterviewPageState extends ConsumerState<InterviewPage>
//     with SingleTickerProviderStateMixin {
//   final AudioRecorder _recorder = AudioRecorder();
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   late AnimationController _animationController;
//   double _opacity = 0.8; // 初期値は0.8

//   @override
//   void initState() {
//     super.initState();

//     // 再生完了時のリスナー
//     _audioPlayer.playerStateStream.listen((playerState) {
//       if (playerState.processingState == ProcessingState.completed) {
//         final viewModelNotifier =
//             ref.read(interviewViewModelProvider(widget.agentId).notifier);
//         viewModelNotifier.updateState(
//             isAgentSpeaking: false, isRecording: false, isRequesting: false);
//       }
//     });

//     // アニメーションコントローラーの初期化
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     )..addListener(() {
//         setState(() {
//           // 透明度を0.5から1.0の間で変化させる
//           _opacity = 0.5 + (0.5 * _animationController.value);
//         });
//       });
//     _animationController.repeat(reverse: true);

//     // 初期化処理を非同期で実行
//     Future.microtask(() {
//       ref
//           .read(interviewViewModelProvider(widget.agentId).notifier)
//           .initializeSession();
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _recorder.dispose();
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   /// 音声を再生（Uint8List の音声データを `just_audio` で再生）
//   Future<void> _playAudio(Uint8List audioData) async {
//     try {
//       final viewModelNotifier =
//           ref.read(interviewViewModelProvider(widget.agentId).notifier);

//       viewModelNotifier.updateState(
//           isAgentSpeaking: true, isRecording: false, isRequesting: false);

//       // 一時ファイルに保存
//       final tempDir = await getTemporaryDirectory();
//       final tempFile = File('${tempDir.path}/temp_audio.mp3');
//       await tempFile.writeAsBytes(audioData);

//       // JustAudio に音声ファイルをセット
//       await _audioPlayer.setFilePath(tempFile.path);
//       await _audioPlayer.play(); // 再生開始
//     } catch (e) {
//       print('音声再生中にエラーが発生しました: $e');
//     }
//   }

//   /// 録音を開始 (WAVフォーマットで保存)
//   Future<void> startRecording() async {
//     try {
//       if (await _recorder.hasPermission()) {
//         final viewModelNotifier =
//             ref.read(interviewViewModelProvider(widget.agentId).notifier);
//         final tempDir = await getTemporaryDirectory();
//         final filePath = '${tempDir.path}/recorded_audio.wav';

//         await _recorder.start(
//           const RecordConfig(
//             encoder: AudioEncoder.wav,
//             sampleRate: 16000,
//             numChannels: 1,
//           ),
//           path: filePath,
//         );

//         viewModelNotifier.updateState(
//             isAgentSpeaking: false, isRecording: true, isRequesting: false);
//         print('録音を開始しました: $filePath');
//       } else {
//         print('録音の権限がありません');
//       }
//     } catch (e) {
//       print('録音開始中にエラーが発生しました: $e');
//     }
//   }

//   /// 録音を停止し、WAVデータを返す
//   Future<Uint8List?> stopRecording() async {
//     try {
//       final viewModelNotifier =
//           ref.read(interviewViewModelProvider(widget.agentId).notifier);

//       final recordedFilePath = await _recorder.stop();
//       if (recordedFilePath != null) {
//         final recordedFile = File(recordedFilePath);
//         final fileBytes = await recordedFile.readAsBytes();
//         viewModelNotifier.updateState(
//             isAgentSpeaking: false, isRecording: false, isRequesting: true);
//         return fileBytes;
//       } else {
//         print('録音停止後のファイルパスが取得できません');
//       }
//     } catch (e) {
//       print('録音停止中にエラーが発生しました: $e');
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = ref.watch(interviewViewModelProvider(widget.agentId));
//     final viewModelNotifier =
//         ref.read(interviewViewModelProvider(widget.agentId).notifier);

//     // エージェント情報を取得
//     final agentAsyncValue = ref.watch(agentViewModelProvider);

//     // リスナーをbuildメソッド内に移動
//     ref.listen<InterviewState>(
//       interviewViewModelProvider(widget.agentId),
//       (previous, next) async {
//         if (next.responseAudioData != null &&
//             next.responseAudioData != previous?.responseAudioData) {
//           // 音声データが更新されたら再生
//           print("以下音声データの中身");
//           print(next.responseAudioData!);
//           await _playAudio(next.responseAudioData!);
//         }

//         // 最終ラウンドでの処理
//         if (next.isFinalRound &&
//             next.responseAudioData != null &&
//             next.responseAudioData != previous?.responseAudioData) {
//           _audioPlayer.playerStateStream.listen((playerState) {
//             if (playerState.processingState == ProcessingState.completed) {
//               context.go(
//                 '/agents/feedback/${widget.agentId}/${next.sessionId}',
//               );
//             }
//           });
//         }
//       },
//     );

//     return agentAsyncValue.when(
//       data: (agents) {
//         final agent = agents.firstWhere((a) => a.agentId == widget.agentId);
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Interview'),
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   agent.name,
//                   style: const TextStyle(
//                       fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 50),
//                 SizedBox(
//                   width: 220,
//                   height: 220,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       if (viewModel.isAgentSpeaking &&
//                           !viewModel.isRecording &&
//                           !viewModel.isRequesting)
//                         // isAgentSpeaking: true の場合のアニメーション
//                         AnimatedBuilder(
//                           animation: _animationController,
//                           builder: (context, child) {
//                             return Container(
//                               width: 200 + (_animationController.value * 20),
//                               height: 200 + (_animationController.value * 20),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.blue.withOpacity(
//                                     0.3 * (1 - _animationController.value)),
//                               ),
//                             );
//                           },
//                         ),
//                       AnimatedOpacity(
//                         duration: const Duration(milliseconds: 500),
//                         opacity: (!viewModel.isAgentSpeaking &&
//                                 !viewModel.isRecording &&
//                                 viewModel.isRequesting)
//                             ? _opacity // アニメーションで変化
//                             : 1.0, // その他の場合は透明度1.0
//                         child: CircleAvatar(
//                           radius: 100,
//                           backgroundImage: agent.imageUrl != null
//                               ? NetworkImage(agent.imageUrl!)
//                               : const AssetImage('assets/placeholder.png')
//                                   as ImageProvider,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 SizedBox(
//                   width: 220,
//                   height: 220,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       // isRecording: true の場合のアニメーション
//                       if (!viewModel.isAgentSpeaking &&
//                           viewModel.isRecording &&
//                           !viewModel.isRequesting)
//                         AnimatedBuilder(
//                           animation: _animationController,
//                           builder: (context, child) {
//                             return Container(
//                               width: 80 + (_animationController.value * 10),
//                               height: 80 + (_animationController.value * 10),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.red.withOpacity(
//                                     0.3 * (1 - _animationController.value)),
//                               ),
//                             );
//                           },
//                         ),
//                       // ボタン本体
//                       ElevatedButton(
//                         onPressed: () async {
//                           if (viewModel.isRecording) {
//                             final recordedAudioData = await stopRecording();
//                             if (recordedAudioData != null) {
//                               await viewModelNotifier.sendAudio(
//                                   recordedAudioData, agent.maxRounds);
//                             }
//                           } else if (!viewModel.isAgentSpeaking &&
//                               !viewModel.isRequesting) {
//                             await startRecording();
//                             viewModelNotifier.startRecording();
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           shape: const CircleBorder(),
//                           padding: const EdgeInsets.all(20),
//                           backgroundColor: viewModel.isRecording
//                               ? Colors.red
//                               : (!viewModel.isAgentSpeaking &&
//                                       !viewModel.isRequesting)
//                                   ? Colors.green
//                                   : Colors.grey,
//                         ),
//                         child: Icon(
//                           viewModel.isRecording ? Icons.stop : Icons.mic,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       loading: () => const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       ),
//       error: (error, _) => Scaffold(
//         body: Center(child: Text('Error: $error')),
//       ),
//     );
//   }
// }
