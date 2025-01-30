// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return _Feedback.fromJson(json);
}

/// @nodoc
mixin _$Feedback {
  String get sessionId => throw _privateConstructorUsedError; // セッションID
  List<ConversationHistory> get conversationHistory =>
      throw _privateConstructorUsedError; // 会話履歴
  FeedbackDetails get feedback =>
      throw _privateConstructorUsedError; // フィードバック情報
// Firestore に createdAt, updatedAt がある場合でも、取得しないよう nullable にする
  @JsonKey(ignore: true)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Feedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackCopyWith<Feedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackCopyWith<$Res> {
  factory $FeedbackCopyWith(Feedback value, $Res Function(Feedback) then) =
      _$FeedbackCopyWithImpl<$Res, Feedback>;
  @useResult
  $Res call(
      {String sessionId,
      List<ConversationHistory> conversationHistory,
      FeedbackDetails feedback,
      @JsonKey(ignore: true) DateTime? createdAt,
      @JsonKey(ignore: true) DateTime? updatedAt});

  $FeedbackDetailsCopyWith<$Res> get feedback;
}

/// @nodoc
class _$FeedbackCopyWithImpl<$Res, $Val extends Feedback>
    implements $FeedbackCopyWith<$Res> {
  _$FeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? conversationHistory = null,
    Object? feedback = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationHistory: null == conversationHistory
          ? _value.conversationHistory
          : conversationHistory // ignore: cast_nullable_to_non_nullable
              as List<ConversationHistory>,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as FeedbackDetails,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedbackDetailsCopyWith<$Res> get feedback {
    return $FeedbackDetailsCopyWith<$Res>(_value.feedback, (value) {
      return _then(_value.copyWith(feedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackImplCopyWith<$Res>
    implements $FeedbackCopyWith<$Res> {
  factory _$$FeedbackImplCopyWith(
          _$FeedbackImpl value, $Res Function(_$FeedbackImpl) then) =
      __$$FeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionId,
      List<ConversationHistory> conversationHistory,
      FeedbackDetails feedback,
      @JsonKey(ignore: true) DateTime? createdAt,
      @JsonKey(ignore: true) DateTime? updatedAt});

  @override
  $FeedbackDetailsCopyWith<$Res> get feedback;
}

/// @nodoc
class __$$FeedbackImplCopyWithImpl<$Res>
    extends _$FeedbackCopyWithImpl<$Res, _$FeedbackImpl>
    implements _$$FeedbackImplCopyWith<$Res> {
  __$$FeedbackImplCopyWithImpl(
      _$FeedbackImpl _value, $Res Function(_$FeedbackImpl) _then)
      : super(_value, _then);

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? conversationHistory = null,
    Object? feedback = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$FeedbackImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      conversationHistory: null == conversationHistory
          ? _value._conversationHistory
          : conversationHistory // ignore: cast_nullable_to_non_nullable
              as List<ConversationHistory>,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as FeedbackDetails,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackImpl implements _Feedback {
  const _$FeedbackImpl(
      {required this.sessionId,
      required final List<ConversationHistory> conversationHistory,
      required this.feedback,
      @JsonKey(ignore: true) this.createdAt,
      @JsonKey(ignore: true) this.updatedAt})
      : _conversationHistory = conversationHistory;

  factory _$FeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackImplFromJson(json);

  @override
  final String sessionId;
// セッションID
  final List<ConversationHistory> _conversationHistory;
// セッションID
  @override
  List<ConversationHistory> get conversationHistory {
    if (_conversationHistory is EqualUnmodifiableListView)
      return _conversationHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversationHistory);
  }

// 会話履歴
  @override
  final FeedbackDetails feedback;
// フィードバック情報
// Firestore に createdAt, updatedAt がある場合でも、取得しないよう nullable にする
  @override
  @JsonKey(ignore: true)
  final DateTime? createdAt;
  @override
  @JsonKey(ignore: true)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Feedback(sessionId: $sessionId, conversationHistory: $conversationHistory, feedback: $feedback, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality()
                .equals(other._conversationHistory, _conversationHistory) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      const DeepCollectionEquality().hash(_conversationHistory),
      feedback,
      createdAt,
      updatedAt);

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackImplCopyWith<_$FeedbackImpl> get copyWith =>
      __$$FeedbackImplCopyWithImpl<_$FeedbackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackImplToJson(
      this,
    );
  }
}

abstract class _Feedback implements Feedback {
  const factory _Feedback(
      {required final String sessionId,
      required final List<ConversationHistory> conversationHistory,
      required final FeedbackDetails feedback,
      @JsonKey(ignore: true) final DateTime? createdAt,
      @JsonKey(ignore: true) final DateTime? updatedAt}) = _$FeedbackImpl;

  factory _Feedback.fromJson(Map<String, dynamic> json) =
      _$FeedbackImpl.fromJson;

  @override
  String get sessionId; // セッションID
  @override
  List<ConversationHistory> get conversationHistory; // 会話履歴
  @override
  FeedbackDetails get feedback; // フィードバック情報
// Firestore に createdAt, updatedAt がある場合でも、取得しないよう nullable にする
  @override
  @JsonKey(ignore: true)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  DateTime? get updatedAt;

  /// Create a copy of Feedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackImplCopyWith<_$FeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConversationHistory _$ConversationHistoryFromJson(Map<String, dynamic> json) {
  return _ConversationHistory.fromJson(json);
}

/// @nodoc
mixin _$ConversationHistory {
  String get role =>
      throw _privateConstructorUsedError; // 役割 (interviewer/interviewee)
  String get message => throw _privateConstructorUsedError;

  /// Serializes this ConversationHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationHistoryCopyWith<ConversationHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationHistoryCopyWith<$Res> {
  factory $ConversationHistoryCopyWith(
          ConversationHistory value, $Res Function(ConversationHistory) then) =
      _$ConversationHistoryCopyWithImpl<$Res, ConversationHistory>;
  @useResult
  $Res call({String role, String message});
}

/// @nodoc
class _$ConversationHistoryCopyWithImpl<$Res, $Val extends ConversationHistory>
    implements $ConversationHistoryCopyWith<$Res> {
  _$ConversationHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationHistoryImplCopyWith<$Res>
    implements $ConversationHistoryCopyWith<$Res> {
  factory _$$ConversationHistoryImplCopyWith(_$ConversationHistoryImpl value,
          $Res Function(_$ConversationHistoryImpl) then) =
      __$$ConversationHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String role, String message});
}

/// @nodoc
class __$$ConversationHistoryImplCopyWithImpl<$Res>
    extends _$ConversationHistoryCopyWithImpl<$Res, _$ConversationHistoryImpl>
    implements _$$ConversationHistoryImplCopyWith<$Res> {
  __$$ConversationHistoryImplCopyWithImpl(_$ConversationHistoryImpl _value,
      $Res Function(_$ConversationHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? message = null,
  }) {
    return _then(_$ConversationHistoryImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationHistoryImpl implements _ConversationHistory {
  const _$ConversationHistoryImpl({required this.role, required this.message});

  factory _$ConversationHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationHistoryImplFromJson(json);

  @override
  final String role;
// 役割 (interviewer/interviewee)
  @override
  final String message;

  @override
  String toString() {
    return 'ConversationHistory(role: $role, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationHistoryImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, role, message);

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationHistoryImplCopyWith<_$ConversationHistoryImpl> get copyWith =>
      __$$ConversationHistoryImplCopyWithImpl<_$ConversationHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationHistoryImplToJson(
      this,
    );
  }
}

abstract class _ConversationHistory implements ConversationHistory {
  const factory _ConversationHistory(
      {required final String role,
      required final String message}) = _$ConversationHistoryImpl;

  factory _ConversationHistory.fromJson(Map<String, dynamic> json) =
      _$ConversationHistoryImpl.fromJson;

  @override
  String get role; // 役割 (interviewer/interviewee)
  @override
  String get message;

  /// Create a copy of ConversationHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationHistoryImplCopyWith<_$ConversationHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackDetails _$FeedbackDetailsFromJson(Map<String, dynamic> json) {
  return _FeedbackDetails.fromJson(json);
}

/// @nodoc
mixin _$FeedbackDetails {
  @JsonKey(name: 'good_points_detailed')
  String get goodPointsDetailed => throw _privateConstructorUsedError; // 良い点の詳細
  @JsonKey(name: 'good_points_summary')
  String get goodPointsSummary => throw _privateConstructorUsedError; // 良い点の要約
  @JsonKey(name: 'improvement_points_detailed')
  String get improvementPointsDetailed =>
      throw _privateConstructorUsedError; // 改善点の詳細
  @JsonKey(name: 'improvement_points_summary')
  String get improvementPointsSummary =>
      throw _privateConstructorUsedError; // 改善点の要約
  @JsonKey(name: 'evaluationScore')
  int get evaluationScore => throw _privateConstructorUsedError; // 5段階評価スコア
  @JsonKey(name: 'evaluationReason')
  String get evaluationReason => throw _privateConstructorUsedError; // 評価の理由
  @JsonKey(name: 'passOrFail')
  String get passOrFail =>
      throw _privateConstructorUsedError; // 合否結果（例："合格" / "不合格"）
  @JsonKey(name: 'reason')
  String get reason => throw _privateConstructorUsedError;

  /// Serializes this FeedbackDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackDetailsCopyWith<FeedbackDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackDetailsCopyWith<$Res> {
  factory $FeedbackDetailsCopyWith(
          FeedbackDetails value, $Res Function(FeedbackDetails) then) =
      _$FeedbackDetailsCopyWithImpl<$Res, FeedbackDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'good_points_detailed') String goodPointsDetailed,
      @JsonKey(name: 'good_points_summary') String goodPointsSummary,
      @JsonKey(name: 'improvement_points_detailed')
      String improvementPointsDetailed,
      @JsonKey(name: 'improvement_points_summary')
      String improvementPointsSummary,
      @JsonKey(name: 'evaluationScore') int evaluationScore,
      @JsonKey(name: 'evaluationReason') String evaluationReason,
      @JsonKey(name: 'passOrFail') String passOrFail,
      @JsonKey(name: 'reason') String reason});
}

/// @nodoc
class _$FeedbackDetailsCopyWithImpl<$Res, $Val extends FeedbackDetails>
    implements $FeedbackDetailsCopyWith<$Res> {
  _$FeedbackDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodPointsDetailed = null,
    Object? goodPointsSummary = null,
    Object? improvementPointsDetailed = null,
    Object? improvementPointsSummary = null,
    Object? evaluationScore = null,
    Object? evaluationReason = null,
    Object? passOrFail = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      goodPointsDetailed: null == goodPointsDetailed
          ? _value.goodPointsDetailed
          : goodPointsDetailed // ignore: cast_nullable_to_non_nullable
              as String,
      goodPointsSummary: null == goodPointsSummary
          ? _value.goodPointsSummary
          : goodPointsSummary // ignore: cast_nullable_to_non_nullable
              as String,
      improvementPointsDetailed: null == improvementPointsDetailed
          ? _value.improvementPointsDetailed
          : improvementPointsDetailed // ignore: cast_nullable_to_non_nullable
              as String,
      improvementPointsSummary: null == improvementPointsSummary
          ? _value.improvementPointsSummary
          : improvementPointsSummary // ignore: cast_nullable_to_non_nullable
              as String,
      evaluationScore: null == evaluationScore
          ? _value.evaluationScore
          : evaluationScore // ignore: cast_nullable_to_non_nullable
              as int,
      evaluationReason: null == evaluationReason
          ? _value.evaluationReason
          : evaluationReason // ignore: cast_nullable_to_non_nullable
              as String,
      passOrFail: null == passOrFail
          ? _value.passOrFail
          : passOrFail // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackDetailsImplCopyWith<$Res>
    implements $FeedbackDetailsCopyWith<$Res> {
  factory _$$FeedbackDetailsImplCopyWith(_$FeedbackDetailsImpl value,
          $Res Function(_$FeedbackDetailsImpl) then) =
      __$$FeedbackDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'good_points_detailed') String goodPointsDetailed,
      @JsonKey(name: 'good_points_summary') String goodPointsSummary,
      @JsonKey(name: 'improvement_points_detailed')
      String improvementPointsDetailed,
      @JsonKey(name: 'improvement_points_summary')
      String improvementPointsSummary,
      @JsonKey(name: 'evaluationScore') int evaluationScore,
      @JsonKey(name: 'evaluationReason') String evaluationReason,
      @JsonKey(name: 'passOrFail') String passOrFail,
      @JsonKey(name: 'reason') String reason});
}

/// @nodoc
class __$$FeedbackDetailsImplCopyWithImpl<$Res>
    extends _$FeedbackDetailsCopyWithImpl<$Res, _$FeedbackDetailsImpl>
    implements _$$FeedbackDetailsImplCopyWith<$Res> {
  __$$FeedbackDetailsImplCopyWithImpl(
      _$FeedbackDetailsImpl _value, $Res Function(_$FeedbackDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goodPointsDetailed = null,
    Object? goodPointsSummary = null,
    Object? improvementPointsDetailed = null,
    Object? improvementPointsSummary = null,
    Object? evaluationScore = null,
    Object? evaluationReason = null,
    Object? passOrFail = null,
    Object? reason = null,
  }) {
    return _then(_$FeedbackDetailsImpl(
      goodPointsDetailed: null == goodPointsDetailed
          ? _value.goodPointsDetailed
          : goodPointsDetailed // ignore: cast_nullable_to_non_nullable
              as String,
      goodPointsSummary: null == goodPointsSummary
          ? _value.goodPointsSummary
          : goodPointsSummary // ignore: cast_nullable_to_non_nullable
              as String,
      improvementPointsDetailed: null == improvementPointsDetailed
          ? _value.improvementPointsDetailed
          : improvementPointsDetailed // ignore: cast_nullable_to_non_nullable
              as String,
      improvementPointsSummary: null == improvementPointsSummary
          ? _value.improvementPointsSummary
          : improvementPointsSummary // ignore: cast_nullable_to_non_nullable
              as String,
      evaluationScore: null == evaluationScore
          ? _value.evaluationScore
          : evaluationScore // ignore: cast_nullable_to_non_nullable
              as int,
      evaluationReason: null == evaluationReason
          ? _value.evaluationReason
          : evaluationReason // ignore: cast_nullable_to_non_nullable
              as String,
      passOrFail: null == passOrFail
          ? _value.passOrFail
          : passOrFail // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackDetailsImpl implements _FeedbackDetails {
  const _$FeedbackDetailsImpl(
      {@JsonKey(name: 'good_points_detailed') required this.goodPointsDetailed,
      @JsonKey(name: 'good_points_summary') required this.goodPointsSummary,
      @JsonKey(name: 'improvement_points_detailed')
      required this.improvementPointsDetailed,
      @JsonKey(name: 'improvement_points_summary')
      required this.improvementPointsSummary,
      @JsonKey(name: 'evaluationScore') required this.evaluationScore,
      @JsonKey(name: 'evaluationReason') required this.evaluationReason,
      @JsonKey(name: 'passOrFail') required this.passOrFail,
      @JsonKey(name: 'reason') required this.reason});

  factory _$FeedbackDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'good_points_detailed')
  final String goodPointsDetailed;
// 良い点の詳細
  @override
  @JsonKey(name: 'good_points_summary')
  final String goodPointsSummary;
// 良い点の要約
  @override
  @JsonKey(name: 'improvement_points_detailed')
  final String improvementPointsDetailed;
// 改善点の詳細
  @override
  @JsonKey(name: 'improvement_points_summary')
  final String improvementPointsSummary;
// 改善点の要約
  @override
  @JsonKey(name: 'evaluationScore')
  final int evaluationScore;
// 5段階評価スコア
  @override
  @JsonKey(name: 'evaluationReason')
  final String evaluationReason;
// 評価の理由
  @override
  @JsonKey(name: 'passOrFail')
  final String passOrFail;
// 合否結果（例："合格" / "不合格"）
  @override
  @JsonKey(name: 'reason')
  final String reason;

  @override
  String toString() {
    return 'FeedbackDetails(goodPointsDetailed: $goodPointsDetailed, goodPointsSummary: $goodPointsSummary, improvementPointsDetailed: $improvementPointsDetailed, improvementPointsSummary: $improvementPointsSummary, evaluationScore: $evaluationScore, evaluationReason: $evaluationReason, passOrFail: $passOrFail, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackDetailsImpl &&
            (identical(other.goodPointsDetailed, goodPointsDetailed) ||
                other.goodPointsDetailed == goodPointsDetailed) &&
            (identical(other.goodPointsSummary, goodPointsSummary) ||
                other.goodPointsSummary == goodPointsSummary) &&
            (identical(other.improvementPointsDetailed,
                    improvementPointsDetailed) ||
                other.improvementPointsDetailed == improvementPointsDetailed) &&
            (identical(
                    other.improvementPointsSummary, improvementPointsSummary) ||
                other.improvementPointsSummary == improvementPointsSummary) &&
            (identical(other.evaluationScore, evaluationScore) ||
                other.evaluationScore == evaluationScore) &&
            (identical(other.evaluationReason, evaluationReason) ||
                other.evaluationReason == evaluationReason) &&
            (identical(other.passOrFail, passOrFail) ||
                other.passOrFail == passOrFail) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      goodPointsDetailed,
      goodPointsSummary,
      improvementPointsDetailed,
      improvementPointsSummary,
      evaluationScore,
      evaluationReason,
      passOrFail,
      reason);

  /// Create a copy of FeedbackDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackDetailsImplCopyWith<_$FeedbackDetailsImpl> get copyWith =>
      __$$FeedbackDetailsImplCopyWithImpl<_$FeedbackDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackDetailsImplToJson(
      this,
    );
  }
}

abstract class _FeedbackDetails implements FeedbackDetails {
  const factory _FeedbackDetails(
      {@JsonKey(name: 'good_points_detailed')
      required final String goodPointsDetailed,
      @JsonKey(name: 'good_points_summary')
      required final String goodPointsSummary,
      @JsonKey(name: 'improvement_points_detailed')
      required final String improvementPointsDetailed,
      @JsonKey(name: 'improvement_points_summary')
      required final String improvementPointsSummary,
      @JsonKey(name: 'evaluationScore') required final int evaluationScore,
      @JsonKey(name: 'evaluationReason') required final String evaluationReason,
      @JsonKey(name: 'passOrFail') required final String passOrFail,
      @JsonKey(name: 'reason')
      required final String reason}) = _$FeedbackDetailsImpl;

  factory _FeedbackDetails.fromJson(Map<String, dynamic> json) =
      _$FeedbackDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'good_points_detailed')
  String get goodPointsDetailed; // 良い点の詳細
  @override
  @JsonKey(name: 'good_points_summary')
  String get goodPointsSummary; // 良い点の要約
  @override
  @JsonKey(name: 'improvement_points_detailed')
  String get improvementPointsDetailed; // 改善点の詳細
  @override
  @JsonKey(name: 'improvement_points_summary')
  String get improvementPointsSummary; // 改善点の要約
  @override
  @JsonKey(name: 'evaluationScore')
  int get evaluationScore; // 5段階評価スコア
  @override
  @JsonKey(name: 'evaluationReason')
  String get evaluationReason; // 評価の理由
  @override
  @JsonKey(name: 'passOrFail')
  String get passOrFail; // 合否結果（例："合格" / "不合格"）
  @override
  @JsonKey(name: 'reason')
  String get reason;

  /// Create a copy of FeedbackDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackDetailsImplCopyWith<_$FeedbackDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
