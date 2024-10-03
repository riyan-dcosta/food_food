// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_global_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appTextThemeHash() => r'bc16cde29486101dc9ba017a93708597ee0f9366';

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

/// See also [appTextTheme].
@ProviderFor(appTextTheme)
const appTextThemeProvider = AppTextThemeFamily();

/// See also [appTextTheme].
class AppTextThemeFamily extends Family<TextTheme> {
  /// See also [appTextTheme].
  const AppTextThemeFamily();

  /// See also [appTextTheme].
  AppTextThemeProvider call(
    BuildContext context,
  ) {
    return AppTextThemeProvider(
      context,
    );
  }

  @override
  AppTextThemeProvider getProviderOverride(
    covariant AppTextThemeProvider provider,
  ) {
    return call(
      provider.context,
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
  String? get name => r'appTextThemeProvider';
}

/// See also [appTextTheme].
class AppTextThemeProvider extends AutoDisposeProvider<TextTheme> {
  /// See also [appTextTheme].
  AppTextThemeProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => appTextTheme(
            ref as AppTextThemeRef,
            context,
          ),
          from: appTextThemeProvider,
          name: r'appTextThemeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$appTextThemeHash,
          dependencies: AppTextThemeFamily._dependencies,
          allTransitiveDependencies:
              AppTextThemeFamily._allTransitiveDependencies,
          context: context,
        );

  AppTextThemeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    TextTheme Function(AppTextThemeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppTextThemeProvider._internal(
        (ref) => create(ref as AppTextThemeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TextTheme> createElement() {
    return _AppTextThemeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppTextThemeProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AppTextThemeRef on AutoDisposeProviderRef<TextTheme> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _AppTextThemeProviderElement extends AutoDisposeProviderElement<TextTheme>
    with AppTextThemeRef {
  _AppTextThemeProviderElement(super.provider);

  @override
  BuildContext get context => (origin as AppTextThemeProvider).context;
}

String _$fireStoreDBHash() => r'c5356e8c3cb68057a2438d40de920338aa61d8e8';

/// See also [FireStoreDB].
@ProviderFor(FireStoreDB)
final fireStoreDBProvider =
    AutoDisposeNotifierProvider<FireStoreDB, FirebaseFirestore>.internal(
  FireStoreDB.new,
  name: r'fireStoreDBProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fireStoreDBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FireStoreDB = AutoDisposeNotifier<FirebaseFirestore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
