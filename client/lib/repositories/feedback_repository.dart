import 'package:interview_agents_ai/models/agent_model.dart';
import '../models/feedback_model.dart';
import '../services/firestore_service.dart';

class FeedbackRepository {
  final FirestoreService _firestoreService;

  FeedbackRepository(this._firestoreService);

  /// 特定のセッションのフィードバックを取得
  Future<Feedback?> fetchFeedback(String sessionId) async {
    try {
      // セッション情報をFirestoreから取得
      final docSnapshot =
          await _firestoreService.getDocument('sessions/$sessionId');

      if (!docSnapshot.exists) {
        print('Session with ID $sessionId does not exist.');
        return null;
      }

      print('docSnapshot.data():${docSnapshot.data()}');

      // Firestore のドキュメントデータを `Feedback` モデルに変換
      return Feedback.fromJson(docSnapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print('Failed to fetch feedback for session $sessionId: $e');
      throw Exception('Failed to fetch feedback.');
    }
  }

  /// 特定のエージェントの情報を取得
  Future<Agent?> fetchAgent(String agentId) async {
    try {
      final docSnapshot =
          await _firestoreService.getDocument('agents/$agentId');

      if (!docSnapshot.exists) {
        print('Agent with ID $agentId does not exist.');
        return null;
      }

      // Firestore のドキュメントデータを `Agent` モデルに変換
      return Agent.fromJson(docSnapshot.data() as Map<String, dynamic>)
          .copyWith(agentId: docSnapshot.id);
    } catch (e) {
      print('Failed to fetch agent with ID $agentId: $e');
      throw Exception('Failed to fetch agent.');
    }
  }
}
