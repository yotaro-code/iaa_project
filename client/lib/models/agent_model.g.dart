// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgentImpl _$$AgentImplFromJson(Map<String, dynamic> json) => _$AgentImpl(
      agentId: json['agentId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
      maxRounds: (json['maxRounds'] as num).toInt(),
      topicSwitchRounds: (json['topicSwitchRounds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      feedbackTemplate: FeedbackTemplate.fromJson(
          json['feedbackTemplate'] as Map<String, dynamic>),
      textToSpeechConfig: TextToSpeechConfig.fromJson(
          json['textToSpeechConfig'] as Map<String, dynamic>),
      lastUpdated: json['lastUpdated'] as String,
    );

Map<String, dynamic> _$$AgentImplToJson(_$AgentImpl instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'maxRounds': instance.maxRounds,
      'topicSwitchRounds': instance.topicSwitchRounds,
      'topics': instance.topics,
      'feedbackTemplate': instance.feedbackTemplate,
      'textToSpeechConfig': instance.textToSpeechConfig,
      'lastUpdated': instance.lastUpdated,
    };

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
      name: json['name'] as String,
      guidance: json['guidance'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'guidance': instance.guidance,
      'keywords': instance.keywords,
    };

_$FeedbackTemplateImpl _$$FeedbackTemplateImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedbackTemplateImpl(
      guidance: json['guidance'] as String,
      points:
          (json['points'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FeedbackTemplateImplToJson(
        _$FeedbackTemplateImpl instance) =>
    <String, dynamic>{
      'guidance': instance.guidance,
      'points': instance.points,
    };

_$TextToSpeechConfigImpl _$$TextToSpeechConfigImplFromJson(
        Map<String, dynamic> json) =>
    _$TextToSpeechConfigImpl(
      ssmlGender: json['ssmlGender'] as String,
      name: json['name'] as String,
      speakingRate: (json['speakingRate'] as num).toDouble(),
      pitch: (json['pitch'] as num).toDouble(),
    );

Map<String, dynamic> _$$TextToSpeechConfigImplToJson(
        _$TextToSpeechConfigImpl instance) =>
    <String, dynamic>{
      'ssmlGender': instance.ssmlGender,
      'name': instance.name,
      'speakingRate': instance.speakingRate,
      'pitch': instance.pitch,
    };
