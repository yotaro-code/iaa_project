import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/agent_model.dart';
import '../repositories/agent_repository.dart';
import '../repositories/repository_providers.dart';

part 'agent_viewmodel.g.dart';

@riverpod
class AgentViewModel extends _$AgentViewModel {
  // 状態の初期化
  @override
  Future<List<Agent>> build() async {
    return await fetchAgents();
  }

  // エージェント一覧を取得
  Future<List<Agent>> fetchAgents() async {
    print("call fetchAgents");
    final agentRepository = ref.read(agentRepositoryProvider);
    print(agentRepository.fetchAgents());
    return await agentRepository.fetchAgents();
  }
}
