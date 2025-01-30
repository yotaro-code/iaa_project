import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../viewmodels/add_agent_viewmodel.dart';

class AddAgentPage extends ConsumerStatefulWidget {
  const AddAgentPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddAgentPage> createState() => _AddAgentPageState();
}

class _AddAgentPageState extends ConsumerState<AddAgentPage> {
  final TextEditingController _agentNameController = TextEditingController();
  final TextEditingController _agentInfoController = TextEditingController();

  @override
  void dispose() {
    _agentNameController.dispose();
    _agentInfoController.dispose();
    super.dispose();
  }

  void _submitAgent() {
    final viewModelNotifier = ref.read(addAgentViewModelProvider.notifier);

    viewModelNotifier.createAgent(
      agentName: _agentNameController.text.trim(),
      agentInformation: _agentInfoController.text.trim(),
      onSuccess: (message) {
        _showSuccessDialog(message);
      },
      onError: (errorMessage) {
        _showErrorDialog(errorMessage);
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("エージェントの作成に成功しました！"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // ダイアログを閉じる
              context.pop(); // AddAgentPage を閉じて前の画面 (AgentListPage) に戻る
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("エラー"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(addAgentViewModelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Agents'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Agent Name
            const Text(
              "Agent Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _agentNameController,
              decoration: InputDecoration(
                hintText: "例：アプリエンジニア採用",
                fillColor: AppColors.contentBackground, // 背景色を設定
                filled: true, // fillColor を有効化
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none, // 枠線を消す場合
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 12), // 適度な余白
              ),
              style: TextStyle(color: AppColors.onContentBackground), // テキスト色
            ),
            const SizedBox(height: 16),

// Agent Information
            const Text(
              "Agent Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _agentInfoController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "想定する採用基準等を入力してください。",
                fillColor: AppColors.contentBackground, // 背景色を設定
                filled: true, // fillColor を有効化
                border: InputBorder.none, // 境界線をなくす
                contentPadding: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 12), // 適度な余白を追加
              ),
            ),
            const SizedBox(height: 24),

            // 送信ボタン
            Center(
              child: ElevatedButton(
                onPressed: state.isLoading ? null : _submitAgent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // 背景色を適用
                  foregroundColor: AppColors.onPrimary, // 文字色を適用
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: state.isLoading
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Text(
                        "Agents作成",
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
