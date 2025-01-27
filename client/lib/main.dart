import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:interview_agents_ai/theme/app_theme.dart';
import 'firebase_options.dart';

import 'views/agent_list_page.dart';
import 'views/interview_page.dart';
import 'views/feedback_page.dart';

void main() async {
  // Firebaseの初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp())); // ProviderScopeを追加
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: appTheme, // 定義したテーマを適用
    );
  }
}

// GoRouterのルーティング設定
final _router = GoRouter(
  initialLocation: '/agents',
  routes: [
    // エージェント一覧画面を基点とする親ルート
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child, // スタックされた子ルートがここに表示される
        );
      },
      routes: [
        // エージェント一覧画面
        GoRoute(
          path: '/agents',
          builder: (context, state) => AgentListPage(),
          routes: [
            // インタビュー画面
            GoRoute(
              path: 'interview/:agentId',
              builder: (context, state) {
                final agentId = state.pathParameters['agentId']!;
                return InterviewPage(agentId: agentId);
              },
            ),
            // フィードバック画面
            GoRoute(
              path: 'feedback/:agentId/:sessionId',
              builder: (context, state) {
                final agentId = state.pathParameters['agentId']!;
                final sessionId = state.pathParameters['sessionId']!;
                return FeedbackPage(agentId: agentId, sessionId: sessionId);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
