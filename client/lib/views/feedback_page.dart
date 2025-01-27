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
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: agent.imageUrl != null
                            ? NetworkImage(agent.imageUrl!)
                            : const AssetImage('assets/placeholder.png')
                                as ImageProvider,
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
                                ? '👤'
                                : '🗣️', // アイコンでロールを表示
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
