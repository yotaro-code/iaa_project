// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedbackViewModelHash() => r'c1f397849a958068d6417a33dbebabee3a964c48';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FeedbackViewModel
    extends BuildlessAutoDisposeAsyncNotifier<FeedbackWithAgent?> {
  late final String sessionId;
  late final String agentId;

  FutureOr<FeedbackWithAgent?> build(
    String sessionId,
    String agentId,
  );
}

/// See also [FeedbackViewModel].
@ProviderFor(FeedbackViewModel)
const feedbackViewModelProvider = FeedbackViewModelFamily();

/// See also [FeedbackViewModel].
class FeedbackViewModelFamily extends Family<AsyncValue<FeedbackWithAgent?>> {
  /// See also [FeedbackViewModel].
  const FeedbackViewModelFamily();

  /// See also [FeedbackViewModel].
  FeedbackViewModelProvider call(
    String sessionId,
    String agentId,
  ) {
    return FeedbackViewModelProvider(
      sessionId,
      agentId,
    );
  }

  @override
  FeedbackViewModelProvider getProviderOverride(
    covariant FeedbackViewModelProvider provider,
  ) {
    return call(
      provider.sessionId,
      provider.agentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedbackViewModelProvider';
}

/// See also [FeedbackViewModel].
class FeedbackViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FeedbackViewModel, FeedbackWithAgent?> {
  /// See also [FeedbackViewModel].
  FeedbackViewModelProvider(
    String sessionId,
    String agentId,
  ) : this._internal(
          () => FeedbackViewModel()
            ..sessionId = sessionId
            ..agentId = agentId,
          from: feedbackViewModelProvider,
          name: r'feedbackViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedbackViewModelHash,
          dependencies: FeedbackViewModelFamily._dependencies,
          allTransitiveDependencies:
              FeedbackViewModelFamily._allTransitiveDependencies,
          sessionId: sessionId,
          agentId: agentId,
        );

  FeedbackViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.agentId,
  }) : super.internal();

  final String sessionId;
  final String agentId;

  @override
  FutureOr<FeedbackWithAgent?> runNotifierBuild(
    covariant FeedbackViewModel notifier,
  ) {
    return notifier.build(
      sessionId,
      agentId,
    );
  }

  @override
  Override overrideWith(FeedbackViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedbackViewModelProvider._internal(
        () => create()
          ..sessionId = sessionId
          ..agentId = agentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<FeedbackViewModel, FeedbackWithAgent?>
      createElement() {
    return _FeedbackViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedbackViewModelProvider &&
        other.sessionId == sessionId &&
        other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedbackViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<FeedbackWithAgent?> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _FeedbackViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FeedbackViewModel,
        FeedbackWithAgent?> with FeedbackViewModelRef {
  _FeedbackViewModelProviderElement(super.provider);

  @override
  String get sessionId => (origin as FeedbackViewModelProvider).sessionId;
  @override
  String get agentId => (origin as FeedbackViewModelProvider).agentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
