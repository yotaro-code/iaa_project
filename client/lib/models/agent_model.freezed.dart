// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Agent _$AgentFromJson(Map<String, dynamic> json) {
  return _Agent.fromJson(json);
}

/// @nodoc
mixin _$Agent {
  String get agentId => throw _privateConstructorUsedError; // エージェントID
  String get name => throw _privateConstructorUsedError; // 名前
  String get description => throw _privateConstructorUsedError; // 説明
  String? get imageUrl =>
      throw _privateConstructorUsedError; // 画像URL (nullable)
  int get maxRounds => throw _privateConstructorUsedError; // 最大ラウンド数
  List<int> get topicSwitchRounds =>
      throw _privateConstructorUsedError; // 話題切り替えラウンド番号
  List<Topic> get topics => throw _privateConstructorUsedError; // 話題リスト
  FeedbackTemplate get feedbackTemplate =>
      throw _privateConstructorUsedError; // フィードバックテンプレート
  TextToSpeechConfig get textToSpeechConfig =>
      throw _privateConstructorUsedError; // Text-to-Speech設定
  String get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this Agent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgentCopyWith<Agent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentCopyWith<$Res> {
  factory $AgentCopyWith(Agent value, $Res Function(Agent) then) =
      _$AgentCopyWithImpl<$Res, Agent>;
  @useResult
  $Res call(
      {String agentId,
      String name,
      String description,
      String? imageUrl,
      int maxRounds,
      List<int> topicSwitchRounds,
      List<Topic> topics,
      FeedbackTemplate feedbackTemplate,
      TextToSpeechConfig textToSpeechConfig,
      String lastUpdated});

  $FeedbackTemplateCopyWith<$Res> get feedbackTemplate;
  $TextToSpeechConfigCopyWith<$Res> get textToSpeechConfig;
}

/// @nodoc
class _$AgentCopyWithImpl<$Res, $Val extends Agent>
    implements $AgentCopyWith<$Res> {
  _$AgentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? maxRounds = null,
    Object? topicSwitchRounds = null,
    Object? topics = null,
    Object? feedbackTemplate = null,
    Object? textToSpeechConfig = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRounds: null == maxRounds
          ? _value.maxRounds
          : maxRounds // ignore: cast_nullable_to_non_nullable
              as int,
      topicSwitchRounds: null == topicSwitchRounds
          ? _value.topicSwitchRounds
          : topicSwitchRounds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
      feedbackTemplate: null == feedbackTemplate
          ? _value.feedbackTemplate
          : feedbackTemplate // ignore: cast_nullable_to_non_nullable
              as FeedbackTemplate,
      textToSpeechConfig: null == textToSpeechConfig
          ? _value.textToSpeechConfig
          : textToSpeechConfig // ignore: cast_nullable_to_non_nullable
              as TextToSpeechConfig,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedbackTemplateCopyWith<$Res> get feedbackTemplate {
    return $FeedbackTemplateCopyWith<$Res>(_value.feedbackTemplate, (value) {
      return _then(_value.copyWith(feedbackTemplate: value) as $Val);
    });
  }

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextToSpeechConfigCopyWith<$Res> get textToSpeechConfig {
    return $TextToSpeechConfigCopyWith<$Res>(_value.textToSpeechConfig,
        (value) {
      return _then(_value.copyWith(textToSpeechConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AgentImplCopyWith<$Res> implements $AgentCopyWith<$Res> {
  factory _$$AgentImplCopyWith(
          _$AgentImpl value, $Res Function(_$AgentImpl) then) =
      __$$AgentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String agentId,
      String name,
      String description,
      String? imageUrl,
      int maxRounds,
      List<int> topicSwitchRounds,
      List<Topic> topics,
      FeedbackTemplate feedbackTemplate,
      TextToSpeechConfig textToSpeechConfig,
      String lastUpdated});

  @override
  $FeedbackTemplateCopyWith<$Res> get feedbackTemplate;
  @override
  $TextToSpeechConfigCopyWith<$Res> get textToSpeechConfig;
}

/// @nodoc
class __$$AgentImplCopyWithImpl<$Res>
    extends _$AgentCopyWithImpl<$Res, _$AgentImpl>
    implements _$$AgentImplCopyWith<$Res> {
  __$$AgentImplCopyWithImpl(
      _$AgentImpl _value, $Res Function(_$AgentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agentId = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? maxRounds = null,
    Object? topicSwitchRounds = null,
    Object? topics = null,
    Object? feedbackTemplate = null,
    Object? textToSpeechConfig = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$AgentImpl(
      agentId: null == agentId
          ? _value.agentId
          : agentId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      maxRounds: null == maxRounds
          ? _value.maxRounds
          : maxRounds // ignore: cast_nullable_to_non_nullable
              as int,
      topicSwitchRounds: null == topicSwitchRounds
          ? _value._topicSwitchRounds
          : topicSwitchRounds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
      feedbackTemplate: null == feedbackTemplate
          ? _value.feedbackTemplate
          : feedbackTemplate // ignore: cast_nullable_to_non_nullable
              as FeedbackTemplate,
      textToSpeechConfig: null == textToSpeechConfig
          ? _value.textToSpeechConfig
          : textToSpeechConfig // ignore: cast_nullable_to_non_nullable
              as TextToSpeechConfig,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgentImpl implements _Agent {
  const _$AgentImpl(
      {required this.agentId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.maxRounds,
      required final List<int> topicSwitchRounds,
      required final List<Topic> topics,
      required this.feedbackTemplate,
      required this.textToSpeechConfig,
      required this.lastUpdated})
      : _topicSwitchRounds = topicSwitchRounds,
        _topics = topics;

  factory _$AgentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgentImplFromJson(json);

  @override
  final String agentId;
// エージェントID
  @override
  final String name;
// 名前
  @override
  final String description;
// 説明
  @override
  final String? imageUrl;
// 画像URL (nullable)
  @override
  final int maxRounds;
// 最大ラウンド数
  final List<int> _topicSwitchRounds;
// 最大ラウンド数
  @override
  List<int> get topicSwitchRounds {
    if (_topicSwitchRounds is EqualUnmodifiableListView)
      return _topicSwitchRounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicSwitchRounds);
  }

// 話題切り替えラウンド番号
  final List<Topic> _topics;
// 話題切り替えラウンド番号
  @override
  List<Topic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

// 話題リスト
  @override
  final FeedbackTemplate feedbackTemplate;
// フィードバックテンプレート
  @override
  final TextToSpeechConfig textToSpeechConfig;
// Text-to-Speech設定
  @override
  final String lastUpdated;

  @override
  String toString() {
    return 'Agent(agentId: $agentId, name: $name, description: $description, imageUrl: $imageUrl, maxRounds: $maxRounds, topicSwitchRounds: $topicSwitchRounds, topics: $topics, feedbackTemplate: $feedbackTemplate, textToSpeechConfig: $textToSpeechConfig, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentImpl &&
            (identical(other.agentId, agentId) || other.agentId == agentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.maxRounds, maxRounds) ||
                other.maxRounds == maxRounds) &&
            const DeepCollectionEquality()
                .equals(other._topicSwitchRounds, _topicSwitchRounds) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.feedbackTemplate, feedbackTemplate) ||
                other.feedbackTemplate == feedbackTemplate) &&
            (identical(other.textToSpeechConfig, textToSpeechConfig) ||
                other.textToSpeechConfig == textToSpeechConfig) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      agentId,
      name,
      description,
      imageUrl,
      maxRounds,
      const DeepCollectionEquality().hash(_topicSwitchRounds),
      const DeepCollectionEquality().hash(_topics),
      feedbackTemplate,
      textToSpeechConfig,
      lastUpdated);

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgentImplCopyWith<_$AgentImpl> get copyWith =>
      __$$AgentImplCopyWithImpl<_$AgentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgentImplToJson(
      this,
    );
  }
}

abstract class _Agent implements Agent {
  const factory _Agent(
      {required final String agentId,
      required final String name,
      required final String description,
      required final String? imageUrl,
      required final int maxRounds,
      required final List<int> topicSwitchRounds,
      required final List<Topic> topics,
      required final FeedbackTemplate feedbackTemplate,
      required final TextToSpeechConfig textToSpeechConfig,
      required final String lastUpdated}) = _$AgentImpl;

  factory _Agent.fromJson(Map<String, dynamic> json) = _$AgentImpl.fromJson;

  @override
  String get agentId; // エージェントID
  @override
  String get name; // 名前
  @override
  String get description; // 説明
  @override
  String? get imageUrl; // 画像URL (nullable)
  @override
  int get maxRounds; // 最大ラウンド数
  @override
  List<int> get topicSwitchRounds; // 話題切り替えラウンド番号
  @override
  List<Topic> get topics; // 話題リスト
  @override
  FeedbackTemplate get feedbackTemplate; // フィードバックテンプレート
  @override
  TextToSpeechConfig get textToSpeechConfig; // Text-to-Speech設定
  @override
  String get lastUpdated;

  /// Create a copy of Agent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgentImplCopyWith<_$AgentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Topic _$TopicFromJson(Map<String, dynamic> json) {
  return _Topic.fromJson(json);
}

/// @nodoc
mixin _$Topic {
  String get name => throw _privateConstructorUsedError; // 話題名
  String get guidance => throw _privateConstructorUsedError; // 話題のガイドライン
  List<String> get keywords => throw _privateConstructorUsedError;

  /// Serializes this Topic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Topic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopicCopyWith<Topic> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicCopyWith<$Res> {
  factory $TopicCopyWith(Topic value, $Res Function(Topic) then) =
      _$TopicCopyWithImpl<$Res, Topic>;
  @useResult
  $Res call({String name, String guidance, List<String> keywords});
}

/// @nodoc
class _$TopicCopyWithImpl<$Res, $Val extends Topic>
    implements $TopicCopyWith<$Res> {
  _$TopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Topic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? guidance = null,
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      guidance: null == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicImplCopyWith<$Res> implements $TopicCopyWith<$Res> {
  factory _$$TopicImplCopyWith(
          _$TopicImpl value, $Res Function(_$TopicImpl) then) =
      __$$TopicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String guidance, List<String> keywords});
}

/// @nodoc
class __$$TopicImplCopyWithImpl<$Res>
    extends _$TopicCopyWithImpl<$Res, _$TopicImpl>
    implements _$$TopicImplCopyWith<$Res> {
  __$$TopicImplCopyWithImpl(
      _$TopicImpl _value, $Res Function(_$TopicImpl) _then)
      : super(_value, _then);

  /// Create a copy of Topic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? guidance = null,
    Object? keywords = null,
  }) {
    return _then(_$TopicImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      guidance: null == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopicImpl implements _Topic {
  const _$TopicImpl(
      {required this.name,
      required this.guidance,
      required final List<String> keywords})
      : _keywords = keywords;

  factory _$TopicImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopicImplFromJson(json);

  @override
  final String name;
// 話題名
  @override
  final String guidance;
// 話題のガイドライン
  final List<String> _keywords;
// 話題のガイドライン
  @override
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  String toString() {
    return 'Topic(name: $name, guidance: $guidance, keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, guidance,
      const DeepCollectionEquality().hash(_keywords));

  /// Create a copy of Topic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicImplCopyWith<_$TopicImpl> get copyWith =>
      __$$TopicImplCopyWithImpl<_$TopicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopicImplToJson(
      this,
    );
  }
}

abstract class _Topic implements Topic {
  const factory _Topic(
      {required final String name,
      required final String guidance,
      required final List<String> keywords}) = _$TopicImpl;

  factory _Topic.fromJson(Map<String, dynamic> json) = _$TopicImpl.fromJson;

  @override
  String get name; // 話題名
  @override
  String get guidance; // 話題のガイドライン
  @override
  List<String> get keywords;

  /// Create a copy of Topic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopicImplCopyWith<_$TopicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FeedbackTemplate _$FeedbackTemplateFromJson(Map<String, dynamic> json) {
  return _FeedbackTemplate.fromJson(json);
}

/// @nodoc
mixin _$FeedbackTemplate {
  String get guidance => throw _privateConstructorUsedError; // フィードバックガイドライン
  List<String> get points => throw _privateConstructorUsedError;

  /// Serializes this FeedbackTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackTemplateCopyWith<FeedbackTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackTemplateCopyWith<$Res> {
  factory $FeedbackTemplateCopyWith(
          FeedbackTemplate value, $Res Function(FeedbackTemplate) then) =
      _$FeedbackTemplateCopyWithImpl<$Res, FeedbackTemplate>;
  @useResult
  $Res call({String guidance, List<String> points});
}

/// @nodoc
class _$FeedbackTemplateCopyWithImpl<$Res, $Val extends FeedbackTemplate>
    implements $FeedbackTemplateCopyWith<$Res> {
  _$FeedbackTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guidance = null,
    Object? points = null,
  }) {
    return _then(_value.copyWith(
      guidance: null == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackTemplateImplCopyWith<$Res>
    implements $FeedbackTemplateCopyWith<$Res> {
  factory _$$FeedbackTemplateImplCopyWith(_$FeedbackTemplateImpl value,
          $Res Function(_$FeedbackTemplateImpl) then) =
      __$$FeedbackTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String guidance, List<String> points});
}

/// @nodoc
class __$$FeedbackTemplateImplCopyWithImpl<$Res>
    extends _$FeedbackTemplateCopyWithImpl<$Res, _$FeedbackTemplateImpl>
    implements _$$FeedbackTemplateImplCopyWith<$Res> {
  __$$FeedbackTemplateImplCopyWithImpl(_$FeedbackTemplateImpl _value,
      $Res Function(_$FeedbackTemplateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guidance = null,
    Object? points = null,
  }) {
    return _then(_$FeedbackTemplateImpl(
      guidance: null == guidance
          ? _value.guidance
          : guidance // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackTemplateImpl implements _FeedbackTemplate {
  const _$FeedbackTemplateImpl(
      {required this.guidance, required final List<String> points})
      : _points = points;

  factory _$FeedbackTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackTemplateImplFromJson(json);

  @override
  final String guidance;
// フィードバックガイドライン
  final List<String> _points;
// フィードバックガイドライン
  @override
  List<String> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  String toString() {
    return 'FeedbackTemplate(guidance: $guidance, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackTemplateImpl &&
            (identical(other.guidance, guidance) ||
                other.guidance == guidance) &&
            const DeepCollectionEquality().equals(other._points, _points));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, guidance, const DeepCollectionEquality().hash(_points));

  /// Create a copy of FeedbackTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackTemplateImplCopyWith<_$FeedbackTemplateImpl> get copyWith =>
      __$$FeedbackTemplateImplCopyWithImpl<_$FeedbackTemplateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackTemplateImplToJson(
      this,
    );
  }
}

abstract class _FeedbackTemplate implements FeedbackTemplate {
  const factory _FeedbackTemplate(
      {required final String guidance,
      required final List<String> points}) = _$FeedbackTemplateImpl;

  factory _FeedbackTemplate.fromJson(Map<String, dynamic> json) =
      _$FeedbackTemplateImpl.fromJson;

  @override
  String get guidance; // フィードバックガイドライン
  @override
  List<String> get points;

  /// Create a copy of FeedbackTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackTemplateImplCopyWith<_$FeedbackTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TextToSpeechConfig _$TextToSpeechConfigFromJson(Map<String, dynamic> json) {
  return _TextToSpeechConfig.fromJson(json);
}

/// @nodoc
mixin _$TextToSpeechConfig {
  String get ssmlGender => throw _privateConstructorUsedError; // 音声の性別
  String get name => throw _privateConstructorUsedError; // 音声モデル名
  double get speakingRate => throw _privateConstructorUsedError; // 話す速度
  double get pitch => throw _privateConstructorUsedError;

  /// Serializes this TextToSpeechConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextToSpeechConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextToSpeechConfigCopyWith<TextToSpeechConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextToSpeechConfigCopyWith<$Res> {
  factory $TextToSpeechConfigCopyWith(
          TextToSpeechConfig value, $Res Function(TextToSpeechConfig) then) =
      _$TextToSpeechConfigCopyWithImpl<$Res, TextToSpeechConfig>;
  @useResult
  $Res call(
      {String ssmlGender, String name, double speakingRate, double pitch});
}

/// @nodoc
class _$TextToSpeechConfigCopyWithImpl<$Res, $Val extends TextToSpeechConfig>
    implements $TextToSpeechConfigCopyWith<$Res> {
  _$TextToSpeechConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextToSpeechConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssmlGender = null,
    Object? name = null,
    Object? speakingRate = null,
    Object? pitch = null,
  }) {
    return _then(_value.copyWith(
      ssmlGender: null == ssmlGender
          ? _value.ssmlGender
          : ssmlGender // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      speakingRate: null == speakingRate
          ? _value.speakingRate
          : speakingRate // ignore: cast_nullable_to_non_nullable
              as double,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextToSpeechConfigImplCopyWith<$Res>
    implements $TextToSpeechConfigCopyWith<$Res> {
  factory _$$TextToSpeechConfigImplCopyWith(_$TextToSpeechConfigImpl value,
          $Res Function(_$TextToSpeechConfigImpl) then) =
      __$$TextToSpeechConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ssmlGender, String name, double speakingRate, double pitch});
}

/// @nodoc
class __$$TextToSpeechConfigImplCopyWithImpl<$Res>
    extends _$TextToSpeechConfigCopyWithImpl<$Res, _$TextToSpeechConfigImpl>
    implements _$$TextToSpeechConfigImplCopyWith<$Res> {
  __$$TextToSpeechConfigImplCopyWithImpl(_$TextToSpeechConfigImpl _value,
      $Res Function(_$TextToSpeechConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextToSpeechConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssmlGender = null,
    Object? name = null,
    Object? speakingRate = null,
    Object? pitch = null,
  }) {
    return _then(_$TextToSpeechConfigImpl(
      ssmlGender: null == ssmlGender
          ? _value.ssmlGender
          : ssmlGender // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      speakingRate: null == speakingRate
          ? _value.speakingRate
          : speakingRate // ignore: cast_nullable_to_non_nullable
              as double,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextToSpeechConfigImpl implements _TextToSpeechConfig {
  const _$TextToSpeechConfigImpl(
      {required this.ssmlGender,
      required this.name,
      required this.speakingRate,
      required this.pitch});

  factory _$TextToSpeechConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextToSpeechConfigImplFromJson(json);

  @override
  final String ssmlGender;
// 音声の性別
  @override
  final String name;
// 音声モデル名
  @override
  final double speakingRate;
// 話す速度
  @override
  final double pitch;

  @override
  String toString() {
    return 'TextToSpeechConfig(ssmlGender: $ssmlGender, name: $name, speakingRate: $speakingRate, pitch: $pitch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextToSpeechConfigImpl &&
            (identical(other.ssmlGender, ssmlGender) ||
                other.ssmlGender == ssmlGender) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.speakingRate, speakingRate) ||
                other.speakingRate == speakingRate) &&
            (identical(other.pitch, pitch) || other.pitch == pitch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ssmlGender, name, speakingRate, pitch);

  /// Create a copy of TextToSpeechConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextToSpeechConfigImplCopyWith<_$TextToSpeechConfigImpl> get copyWith =>
      __$$TextToSpeechConfigImplCopyWithImpl<_$TextToSpeechConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextToSpeechConfigImplToJson(
      this,
    );
  }
}

abstract class _TextToSpeechConfig implements TextToSpeechConfig {
  const factory _TextToSpeechConfig(
      {required final String ssmlGender,
      required final String name,
      required final double speakingRate,
      required final double pitch}) = _$TextToSpeechConfigImpl;

  factory _TextToSpeechConfig.fromJson(Map<String, dynamic> json) =
      _$TextToSpeechConfigImpl.fromJson;

  @override
  String get ssmlGender; // 音声の性別
  @override
  String get name; // 音声モデル名
  @override
  double get speakingRate; // 話す速度
  @override
  double get pitch;

  /// Create a copy of TextToSpeechConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextToSpeechConfigImplCopyWith<_$TextToSpeechConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
