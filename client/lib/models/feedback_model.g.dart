// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackImpl _$$FeedbackImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackImpl(
      sessionId: json['sessionId'] as String,
      conversationHistory: (json['conversationHistory'] as List<dynamic>)
          .map((e) => ConversationHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedback:
          FeedbackDetails.fromJson(json['feedback'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FeedbackImplToJson(_$FeedbackImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'conversationHistory': instance.conversationHistory,
      'feedback': instance.feedback,
    };

_$ConversationHistoryImpl _$$ConversationHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationHistoryImpl(
      role: json['role'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$ConversationHistoryImplToJson(
        _$ConversationHistoryImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'message': instance.message,
    };

_$FeedbackDetailsImpl _$$FeedbackDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackDetailsImpl(
      goodPointsDetailed: json['good_points_detailed'] as String,
      improvementPointsDetailed: json['improvement_points_detailed'] as String,
    );

Map<String, dynamic> _$$FeedbackDetailsImplToJson(
        _$FeedbackDetailsImpl instance) =>
    <String, dynamic>{
      'good_points_detailed': instance.goodPointsDetailed,
      'improvement_points_detailed': instance.improvementPointsDetailed,
    };
