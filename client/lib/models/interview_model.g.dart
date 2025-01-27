// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InterviewStateImpl _$$InterviewStateImplFromJson(Map<String, dynamic> json) =>
    _$InterviewStateImpl(
      sessionId: json['sessionId'] as String,
      userId: json['userId'] as String,
      agentId: json['agentId'] as String,
      isAgentSpeaking: json['isAgentSpeaking'] as bool,
      isRecording: json['isRecording'] as bool,
      isRequesting: json['isRequesting'] as bool,
      currentRound: (json['currentRound'] as num).toInt(),
      isFinalRound: json['isFinalRound'] as bool,
      requestAudioData: _uint8ListFromJson(json['requestAudioData'] as String?),
      responseAudioData:
          _uint8ListFromJson(json['responseAudioData'] as String?),
    );

Map<String, dynamic> _$$InterviewStateImplToJson(
        _$InterviewStateImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'userId': instance.userId,
      'agentId': instance.agentId,
      'isAgentSpeaking': instance.isAgentSpeaking,
      'isRecording': instance.isRecording,
      'isRequesting': instance.isRequesting,
      'currentRound': instance.currentRound,
      'isFinalRound': instance.isFinalRound,
      'requestAudioData': _uint8ListToJson(instance.requestAudioData),
      'responseAudioData': _uint8ListToJson(instance.responseAudioData),
    };
