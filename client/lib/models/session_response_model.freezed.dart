// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) {
  return _SessionResponse.fromJson(json);
}

/// @nodoc
mixin _$SessionResponse {
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List get audioData => throw _privateConstructorUsedError;

  /// Serializes this SessionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionResponseCopyWith<SessionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionResponseCopyWith<$Res> {
  factory $SessionResponseCopyWith(
          SessionResponse value, $Res Function(SessionResponse) then) =
      _$SessionResponseCopyWithImpl<$Res, SessionResponse>;
  @useResult
  $Res call(
      {String sessionId,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List audioData});
}

/// @nodoc
class _$SessionResponseCopyWithImpl<$Res, $Val extends SessionResponse>
    implements $SessionResponseCopyWith<$Res> {
  _$SessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? audioData = null,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      audioData: null == audioData
          ? _value.audioData
          : audioData // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionResponseImplCopyWith<$Res>
    implements $SessionResponseCopyWith<$Res> {
  factory _$$SessionResponseImplCopyWith(_$SessionResponseImpl value,
          $Res Function(_$SessionResponseImpl) then) =
      __$$SessionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List audioData});
}

/// @nodoc
class __$$SessionResponseImplCopyWithImpl<$Res>
    extends _$SessionResponseCopyWithImpl<$Res, _$SessionResponseImpl>
    implements _$$SessionResponseImplCopyWith<$Res> {
  __$$SessionResponseImplCopyWithImpl(
      _$SessionResponseImpl _value, $Res Function(_$SessionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? audioData = null,
  }) {
    return _then(_$SessionResponseImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      audioData: null == audioData
          ? _value.audioData
          : audioData // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionResponseImpl implements _SessionResponse {
  const _$SessionResponseImpl(
      {required this.sessionId,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      required this.audioData});

  factory _$SessionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionResponseImplFromJson(json);

  @override
  final String sessionId;
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  final Uint8List audioData;

  @override
  String toString() {
    return 'SessionResponse(sessionId: $sessionId, audioData: $audioData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionResponseImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other.audioData, audioData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sessionId, const DeepCollectionEquality().hash(audioData));

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      __$$SessionResponseImplCopyWithImpl<_$SessionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionResponseImplToJson(
      this,
    );
  }
}

abstract class _SessionResponse implements SessionResponse {
  const factory _SessionResponse(
      {required final String sessionId,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      required final Uint8List audioData}) = _$SessionResponseImpl;

  factory _SessionResponse.fromJson(Map<String, dynamic> json) =
      _$SessionResponseImpl.fromJson;

  @override
  String get sessionId;
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List get audioData;

  /// Create a copy of SessionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionResponseImplCopyWith<_$SessionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
