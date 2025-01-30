import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_agents_ai/repositories/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_agent_viewmodel.g.dart';

@riverpod
class AddAgentViewModel extends _$AddAgentViewModel {
  @override
  Future<void> build() async {}

  Future<void> createAgent({
    required String agentName,
    required String agentInformation,
    required Function(String) onSuccess,
    required Function(String) onError,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(addAgentRepositoryProvider);
      final message = await repository.createAgent(agentName, agentInformation);
      state = AsyncValue.data(null);
      onSuccess(message);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      onError("エージェントの作成に失敗しました。");
    }
  }
}
