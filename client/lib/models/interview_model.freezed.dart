// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InterviewState _$InterviewStateFromJson(Map<String, dynamic> json) {
  return _InterviewState.fromJson(json);
}

/// @nodoc
mixin _$InterviewState {
  String get sessionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get agentId => throw _privateConstructorUsedError;
  bool get isAgentSpeaking => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  bool get isRequesting => throw _privateConstructorUsedError;
  int get currentRound => throw _privateConstructorUsedError;
  bool get isFinalRound => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List? get requestAudioData =>
      throw _privateConstructorUsedError; // 録音データ
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List? get responseAudioData => throw _privateConstructorUsedError;

  /// Serializes this InterviewState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InterviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InterviewStateCopyWith<InterviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterviewStateCopyWith<$Res> {
  factory $InterviewStateCopyWith(
          InterviewState value, $Res Function(InterviewState) then) =
      _$InterviewStateCopyWithImpl<$Res, InterviewState>;
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      String agentId,
      bool isAgentSpeaking,
      bool isRecording,
      bool isRequesting,
      int currentRound,
      bool isFinalRound,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List? requestAudioData,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List? responseAudioData});
}

/// @nodoc
class _$InterviewStateCopyWithImpl<$Res, $Val extends InterviewState>
    implements $InterviewStateCopyWith<$Res> {
  _$InterviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InterviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? agentId = null,
    Object? isAgentSpeaking = null,
    Object? isRecording = null,
    Object? isRequesting = null,
    Object? currentRound = null,
    Object? isFinalRound = null,
    Object? requestAudioData = freezed,
    Object? responseAudioData = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAgentSpeaking: null == isAgentSpeaking
          ? _value.isAgentSpeaking
          : isAgentSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequesting: null == isRequesting
          ? _value.isRequesting
          : isRequesting // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      isFinalRound: null == isFinalRound
          ? _value.isFinalRound
          : isFinalRound // ignore: cast_nullable_to_non_nullable
              as bool,
      requestAudioData: freezed == requestAudioData
          ? _value.requestAudioData
          : requestAudioData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      responseAudioData: freezed == responseAudioData
          ? _value.responseAudioData
          : responseAudioData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterviewStateImplCopyWith<$Res>
    implements $InterviewStateCopyWith<$Res> {
  factory _$$InterviewStateImplCopyWith(_$InterviewStateImpl value,
          $Res Function(_$InterviewStateImpl) then) =
      __$$InterviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      String userId,
      String agentId,
      bool isAgentSpeaking,
      bool isRecording,
      bool isRequesting,
      int currentRound,
      bool isFinalRound,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List? requestAudioData,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      Uint8List? responseAudioData});
}

/// @nodoc
class __$$InterviewStateImplCopyWithImpl<$Res>
    extends _$InterviewStateCopyWithImpl<$Res, _$InterviewStateImpl>
    implements _$$InterviewStateImplCopyWith<$Res> {
  __$$InterviewStateImplCopyWithImpl(
      _$InterviewStateImpl _value, $Res Function(_$InterviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of InterviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = null,
    Object? agentId = null,
    Object? isAgentSpeaking = null,
    Object? isRecording = null,
    Object? isRequesting = null,
    Object? currentRound = null,
    Object? isFinalRound = null,
    Object? requestAudioData = freezed,
    Object? responseAudioData = freezed,
  }) {
    return _then(_$InterviewStateImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      isAgentSpeaking: null == isAgentSpeaking
          ? _value.isAgentSpeaking
          : isAgentSpeaking // ignore: cast_nullable_to_non_nullable
              as bool,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequesting: null == isRequesting
          ? _value.isRequesting
          : isRequesting // ignore: cast_nullable_to_non_nullable
              as bool,
      currentRound: null == currentRound
          ? _value.currentRound
          : currentRound // ignore: cast_nullable_to_non_nullable
              as int,
      isFinalRound: null == isFinalRound
          ? _value.isFinalRound
          : isFinalRound // ignore: cast_nullable_to_non_nullable
              as bool,
      requestAudioData: freezed == requestAudioData
          ? _value.requestAudioData
          : requestAudioData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      responseAudioData: freezed == responseAudioData
          ? _value.responseAudioData
          : responseAudioData // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterviewStateImpl implements _InterviewState {
  const _$InterviewStateImpl(
      {required this.sessionId,
      required this.userId,
      required this.agentId,
      required this.isAgentSpeaking,
      required this.isRecording,
      required this.isRequesting,
      required this.currentRound,
      required this.isFinalRound,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      this.requestAudioData,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      this.responseAudioData});

  factory _$InterviewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterviewStateImplFromJson(json);

  @override
  final String sessionId;
  @override
  final String userId;
  @override
  final String agentId;
  @override
  final bool isAgentSpeaking;
  @override
  final bool isRecording;
  @override
  final bool isRequesting;
  @override
  final int currentRound;
  @override
  final bool isFinalRound;
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  final Uint8List? requestAudioData;
// 録音データ
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  final Uint8List? responseAudioData;

  @override
  String toString() {
    return 'InterviewState(sessionId: $sessionId, userId: $userId, agentId: $agentId, isAgentSpeaking: $isAgentSpeaking, isRecording: $isRecording, isRequesting: $isRequesting, currentRound: $currentRound, isFinalRound: $isFinalRound, requestAudioData: $requestAudioData, responseAudioData: $responseAudioData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterviewStateImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.isAgentSpeaking, isAgentSpeaking) ||
                other.isAgentSpeaking == isAgentSpeaking) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.isRequesting, isRequesting) ||
                other.isRequesting == isRequesting) &&
            (identical(other.currentRound, currentRound) ||
                other.currentRound == currentRound) &&
            (identical(other.isFinalRound, isFinalRound) ||
                other.isFinalRound == isFinalRound) &&
            const DeepCollectionEquality()
                .equals(other.requestAudioData, requestAudioData) &&
            const DeepCollectionEquality()
                .equals(other.responseAudioData, responseAudioData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      userId,
      agentId,
      isAgentSpeaking,
      isRecording,
      isRequesting,
      currentRound,
      isFinalRound,
      const DeepCollectionEquality().hash(requestAudioData),
      const DeepCollectionEquality().hash(responseAudioData));

  /// Create a copy of InterviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InterviewStateImplCopyWith<_$InterviewStateImpl> get copyWith =>
      __$$InterviewStateImplCopyWithImpl<_$InterviewStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterviewStateImplToJson(
      this,
    );
  }
}

abstract class _InterviewState implements InterviewState {
  const factory _InterviewState(
      {required final String sessionId,
      required final String userId,
      required final String agentId,
      required final bool isAgentSpeaking,
      required final bool isRecording,
      required final bool isRequesting,
      required final int currentRound,
      required final bool isFinalRound,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      final Uint8List? requestAudioData,
      @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
      final Uint8List? responseAudioData}) = _$InterviewStateImpl;

  factory _InterviewState.fromJson(Map<String, dynamic> json) =
      _$InterviewStateImpl.fromJson;

  @override
  String get sessionId;
  @override
  String get userId;
  @override
  String get agentId;
  @override
  bool get isAgentSpeaking;
  @override
  bool get isRecording;
  @override
  bool get isRequesting;
  @override
  int get currentRound;
  @override
  bool get isFinalRound;
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List? get requestAudioData; // 録音データ
  @override
  @JsonKey(fromJson: _uint8ListFromJson, toJson: _uint8ListToJson)
  Uint8List? get responseAudioData;

  /// Create a copy of InterviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InterviewStateImplCopyWith<_$InterviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
