import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview_model.freezed.dart';
part 'interview_model.g.dart';

@freezed
class InterviewState with _$InterviewState {
  const factory InterviewState({
    required String sessionId,
    required String userId,
    required String agentId,
    required bool isAgentSpeaking,
    required bool isRecording,
    required bool isRequesting,
    required int currentRound,
    required bool isFinalRound,
    @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
    Uint8List? requestAudioData, // 録音データ
    @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
    Uint8List? responseAudioData, // サーバーからの音声データ
  }) = _InterviewState;

  factory InterviewState.fromJson(Map<String, dynamic> json) =>
      _$InterviewStateFromJson(json);
}

// カスタム変換ロジック
Uint8List _uint8ListFromJson(String? json) => json != null
    ? Uint8List.fromList(List<int>.from(json.codeUnits))
    : Uint8List(0);

String? _uint8ListToJson(Uint8List? data) =>
    data != null ? String.fromCharCodes(data) : null;
