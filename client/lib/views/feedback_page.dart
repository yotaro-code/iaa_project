import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/feedback_viewmodel.dart';

class FeedbackPage extends ConsumerWidget {
  final String sessionId;
  final String agentId;

  const FeedbackPage({
    required this.sessionId,
    required this.agentId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackAsyncValue =
        ref.watch(feedbackViewModelProvider(sessionId, agentId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(); // 必ずエージェント画面に戻る
          },
        ),
      ),
      body: feedbackAsyncValue.when(
        data: (feedbackWithAgent) {
          if (feedbackWithAgent == null) {
            return const Center(child: Text('データが見つかりませんでした'));
          }

          final agent = feedbackWithAgent.agent;
          final feedback = feedbackWithAgent.feedback;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // エージェント情報
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // 背景を白に設定
                        ),
                        child: ClipOval(
                          child: FittedBox(
                            fit: BoxFit.contain, // 画像が円の中に収まるように調整
                            child: Image.network(
                              agent.imageUrl ??
                                  'https://via.placeholder.com/100',
                              width: 100, // 画像の幅（円の直径に合わせる）
                              height: 100, // 画像の高さ（円の直径に合わせる）
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        agent.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        agent.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                buildDivider(),

                // 評価結果
                const Text(
                  '評価結果',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // 合否結果と星評価を横並びで表示
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 中央揃え
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        feedback.feedback.passOrFail,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: feedback.feedback.passOrFail == '合格'
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8), // 間隔を調整

                      // 星評価（5段階）
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < feedback.feedback.evaluationScore
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber[700], // 濃い黄色
                            size: 28, // 少し大きく
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

// 評価理由
                Text(
                  feedback.feedback.reason,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),

                buildDivider(),

                // 良かった点
                const Text(
                  '良かった点',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feedback.feedback.goodPointsDetailed,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                buildDivider(),

                // 改善点
                const Text(
                  '改善点',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feedback.feedback.improvementPointsDetailed,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                buildDivider(),
                // インタビュー履歴
                const Text(
                  'インタビュー履歴',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  children: feedback.conversationHistory.map((history) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            history.role == 'interviewer'
                                ? 'Q. '
                                : 'A. ', // アイコンでロールを表示
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              history.message,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stack) => Center(
          child: Text('エラーが発生しました: $e'),
        ),
      ),
    );
  }
}

Widget buildDivider() {
  return Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.grey, // 区切り線の色
          width: 0.5, // 区切り線の太さ
        ),
      ),
    ),
    margin: const EdgeInsets.symmetric(vertical: 12), // 上下の余白
  );
}
