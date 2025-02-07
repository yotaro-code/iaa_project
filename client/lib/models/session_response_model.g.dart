// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionResponseImpl _$$SessionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionResponseImpl(
      sessionId: json['sessionId'] as String,
      audioData: _uint8ListFromJson(json['audioData'] as List<int>),
    );

Map<String, dynamic> _$$SessionResponseImplToJson(
        _$SessionResponseImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'audioData': _uint8ListToJson(instance.audioData),
    };
