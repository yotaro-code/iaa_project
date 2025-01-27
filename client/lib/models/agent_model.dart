import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_model.freezed.dart';
part 'agent_model.g.dart';

@freezed
class Agent with _$Agent {
  const factory Agent({
    required String agentId, // エージェントID
    required String name, // 名前
    required String description, // 説明
    required String? imageUrl, // 画像URL (nullable)
    required int maxRounds, // 最大ラウンド数
    required List<int> topicSwitchRounds, // 話題切り替えラウンド番号
    required List<Topic> topics, // 話題リスト
    required FeedbackTemplate feedbackTemplate, // フィードバックテンプレート
    required String lastUpdated, // 最終更新日時（ISO8601形式）
  }) = _Agent;

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);
}

@freezed
class Topic with _$Topic {
  const factory Topic({
    required String name, // 話題名
    required String guidance, // 話題のガイドライン
    required List<String> keywords, // 話題に関連するキーワード
  }) = _Topic;

  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
}

@freezed
class FeedbackTemplate with _$FeedbackTemplate {
  const factory FeedbackTemplate({
    required String guidance, // フィードバックガイドライン
    required List<String> points, // 評価ポイント
  }) = _FeedbackTemplate;

  factory FeedbackTemplate.fromJson(Map<String, dynamic> json) =>
      _$FeedbackTemplateFromJson(json);
}
