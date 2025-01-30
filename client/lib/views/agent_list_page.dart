import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/agent_viewmodel.dart';

class AgentListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agentsAsyncValue = ref.watch(agentViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('エージェント一覧')),
      body: agentsAsyncValue.when(
        data: (agents) {
          return ListView.builder(
            padding: const EdgeInsets.all(0), // ページ全体に余白なし
            itemCount: agents.length,
            itemBuilder: (context, index) {
              final agent = agents[index];
              return InkWell(
                onTap: () {
                  // agentIdを指定して遷移
                  context.push('/agents/interview/${agent.agentId}');
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0), // コンテンツ内の余白
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey, // 区切り線の色
                        width: 0.5, // 区切り線の太さ
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      // 左側: 画像
                      ClipOval(
                        child: Image.network(
                          agent.imageUrl ??
                              'https://via.placeholder.com/80', // 画像URLがない場合の仮画像
                          width: 80.0, // 円形の幅
                          height: 80.0, // 円形の高さ
                          fit: BoxFit.cover, // 画像の表示方法
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      // 右側: エージェント名と説明
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              agent.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              agent.description,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
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
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('エラーが発生しました: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/agents/add'); // 追加画面へ遷移
        },
        elevation: 0, // 影なし
        child: const Icon(Icons.add, size: 28), // "+" アイコン
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // 右下に配置
    );
  }
}
