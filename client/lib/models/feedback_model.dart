import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required String sessionId, // セッションID
    required List<ConversationHistory> conversationHistory, // 会話履歴
    required FeedbackDetails feedback, // ネストされたフィードバック情報
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
    @JsonKey(name: 'improvement_points_detailed')
    required String improvementPointsDetailed, // 改善点の詳細
  }) = _FeedbackDetails;

  factory FeedbackDetails.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDetailsFromJson(json);
}
