// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$interviewViewModelHash() =>
    r'37ec81b196cd37e8a1edc227f873bba5570b79d1';

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

abstract class _$InterviewViewModel
    extends BuildlessAutoDisposeNotifier<InterviewState> {
  late final String agentId;

  InterviewState build(
    String agentId,
  );
}

/// See also [InterviewViewModel].
@ProviderFor(InterviewViewModel)
const interviewViewModelProvider = InterviewViewModelFamily();

/// See also [InterviewViewModel].
class InterviewViewModelFamily extends Family<InterviewState> {
  /// See also [InterviewViewModel].
  const InterviewViewModelFamily();

  /// See also [InterviewViewModel].
  InterviewViewModelProvider call(
    String agentId,
  ) {
    return InterviewViewModelProvider(
      agentId,
    );
  }

  @override
  InterviewViewModelProvider getProviderOverride(
    covariant InterviewViewModelProvider provider,
  ) {
    return call(
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
  String? get name => r'interviewViewModelProvider';
}

/// See also [InterviewViewModel].
class InterviewViewModelProvider extends AutoDisposeNotifierProviderImpl<
    InterviewViewModel, InterviewState> {
  /// See also [InterviewViewModel].
  InterviewViewModelProvider(
    String agentId,
  ) : this._internal(
          () => InterviewViewModel()..agentId = agentId,
          from: interviewViewModelProvider,
          name: r'interviewViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$interviewViewModelHash,
          dependencies: InterviewViewModelFamily._dependencies,
          allTransitiveDependencies:
              InterviewViewModelFamily._allTransitiveDependencies,
          agentId: agentId,
        );

  InterviewViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.agentId,
  }) : super.internal();

  final String agentId;

  @override
  InterviewState runNotifierBuild(
    covariant InterviewViewModel notifier,
  ) {
    return notifier.build(
      agentId,
    );
  }

  @override
  Override overrideWith(InterviewViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: InterviewViewModelProvider._internal(
        () => create()..agentId = agentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        agentId: agentId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<InterviewViewModel, InterviewState>
      createElement() {
    return _InterviewViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InterviewViewModelProvider && other.agentId == agentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, agentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InterviewViewModelRef on AutoDisposeNotifierProviderRef<InterviewState> {
  /// The parameter `agentId` of this provider.
  String get agentId;
}

class _InterviewViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<InterviewViewModel,
        InterviewState> with InterviewViewModelRef {
  _InterviewViewModelProviderElement(super.provider);

  @override
  String get agentId => (origin as InterviewViewModelProvider).agentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
