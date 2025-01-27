import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/feedback_model.dart';
import '../models/agent_model.dart';
import '../repositories/feedback_repository.dart';
import '../repositories/agent_repository.dart';
import '../repositories/repository_providers.dart';

part 'feedback_viewmodel.g.dart';

@riverpod
class FeedbackViewModel extends _$FeedbackViewModel {
  @override
  Future<FeedbackWithAgent?> build(String sessionId, String agentId) async {
    return await fetchFeedbackAndAgent(sessionId, agentId);
  }

  /// FeedbackとAgentの両方をFirestoreから取得
  Future<FeedbackWithAgent?> fetchFeedbackAndAgent(
      String sessionId, String agentId) async {
    try {
      final feedbackRepository = ref.read(feedbackRepositoryProvider);
      final agentRepository = ref.read(agentRepositoryProvider);

      // 両方のデータを同時に取得
      final feedback = await feedbackRepository.fetchFeedback(sessionId);
      final agent = await agentRepository.fetchAgent(agentId);

      // エージェントまたはフィードバックが取得できない場合はnullを返す
      if (feedback == null || agent == null) {
        return null;
      }

      return FeedbackWithAgent(
        feedback: feedback,
        agent: agent,
      );
    } catch (e) {
      throw Exception('データの取得中にエラーが発生しました: $e');
    }
  }
}

/// FeedbackとAgentの情報をまとめたクラス
class FeedbackWithAgent {
  final Feedback feedback;
  final Agent agent;

  FeedbackWithAgent({
    required this.feedback,
    required this.agent,
  });
}
