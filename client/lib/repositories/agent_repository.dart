import '../services/firestore_service.dart';
import '../models/agent_model.dart';

class AgentRepository {
  final FirestoreService _firestoreService;

  AgentRepository(this._firestoreService);

  // エージェント一覧を取得
  Future<List<Agent>> fetchAgents() async {
    final querySnapshot = await _firestoreService.getCollection('agents');
    return querySnapshot.docs.map((doc) {
      return Agent.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(agentId: doc.id);
    }).toList();
  }

  // 特定のエージェントを取得
  Future<Agent?> fetchAgent(String agentId) async {
    final docSnapshot = await _firestoreService.getDocument('agents/$agentId');
    if (!docSnapshot.exists) {
      return null;
    }
    return Agent.fromJson(docSnapshot.data() as Map<String, dynamic>)
        .copyWith(agentId: docSnapshot.id);
  }

  // エージェントを更新
  Future<void> updateAgent(Agent agent) async {
    await _firestoreService.updateDocument(
      'agents/${agent.agentId}',
      agent.toJson(),
    );
  }
}
