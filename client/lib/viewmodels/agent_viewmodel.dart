import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/agent_model.dart';
import '../repositories/agent_repository.dart';
import '../repositories/repository_providers.dart';

part 'agent_viewmodel.g.dart';

@riverpod
class AgentViewModel extends _$AgentViewModel {
  /// ビルドメソッドをストリームベースに変更
  @override
  Stream<List<Agent>> build() {
    print("AgentViewModel: Listening to streamAgents");
    final agentRepository = ref.watch(agentRepositoryProvider);
    return agentRepository.streamAgents();
  }

  Future<void> deleteAgent(String agentId) async {
    final agentRepository = ref.read(agentRepositoryProvider);
    await agentRepository.deleteAgent(agentId);
  }
}
