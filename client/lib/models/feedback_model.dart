import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String sessionId, // セッションID
    required List<ConversationHistory> conversationHistory, // 会話履歴
    required FeedbackDetails feedback, // フィードバック情報

    // Firestore に createdAt, updatedAt がある場合でも、取得しないよう nullable にする
    @JsonKey(ignore: true) DateTime? createdAt,
    @JsonKey(ignore: true) DateTime? updatedAt,
  }) = _Feedback;

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
}

@freezed
class ConversationHistory with _$ConversationHistory {
  const factory ConversationHistory({
    required String role, // 役割 (interviewer/interviewee)
    required String message, // メッセージ内容
  }) = _ConversationHistory;

  factory ConversationHistory.fromJson(Map<String, dynamic> json) =>
      _$ConversationHistoryFromJson(json);
}

@freezed
class FeedbackDetails with _$FeedbackDetails {
  const factory FeedbackDetails({
    @JsonKey(name: 'good_points_detailed')
    required String goodPointsDetailed, // 良い点の詳細

    @JsonKey(name: 'good_points_summary')
    required String goodPointsSummary, // 良い点の要約

    @JsonKey(name: 'improvement_points_detailed')
    required String improvementPointsDetailed, // 改善点の詳細

    @JsonKey(name: 'improvement_points_summary')
    required String improvementPointsSummary, // 改善点の要約

    @JsonKey(name: 'evaluationScore') required int evaluationScore, // 5段階評価スコア

    @JsonKey(name: 'evaluationReason')
    required String evaluationReason, // 評価の理由

    @JsonKey(name: 'passOrFail')
    required String passOrFail, // 合否結果（例："合格" / "不合格"）

    @JsonKey(name: 'reason') required String reason, // 合否の詳細な理由
  }) = _FeedbackDetails;

  factory FeedbackDetails.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDetailsFromJson(json);
}
