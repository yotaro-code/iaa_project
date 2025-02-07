import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_response_model.freezed.dart';
part 'session_response_model.g.dart';

@freezed
class SessionResponse with _$SessionResponse {
  const factory SessionResponse({
    required String sessionId,
    @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
    required Uint8List audioData,
  }) = _SessionResponse;

  factory SessionResponse.fromJson(Map<String, dynamic> json) =>
      _$SessionResponseFromJson(json);
}

// カスタム変換ロジック
Uint8List _uint8ListFromJson(List<int> json) => Uint8List.fromList(json);
List<int> _uint8ListToJson(Uint8List data) => data.toList();
