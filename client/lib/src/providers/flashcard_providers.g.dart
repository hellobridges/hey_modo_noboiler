// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDecksHash() => r'fea5e51a4af57ddbd6ed3f3c2e833a85f300d469';

/// Provider for user's decks
///
/// Copied from [userDecks].
@ProviderFor(userDecks)
final userDecksProvider = AutoDisposeFutureProvider<List<Deck>>.internal(
  userDecks,
  name: r'userDecksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userDecksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserDecksRef = AutoDisposeFutureProviderRef<List<Deck>>;
String _$rootDecksHash() => r'4dd7e60d215e40856dbd0d20a74674ae0cfbc53a';

/// Provider for root decks (decks with no parent)
///
/// Copied from [rootDecks].
@ProviderFor(rootDecks)
final rootDecksProvider = AutoDisposeFutureProvider<List<Deck>>.internal(
  rootDecks,
  name: r'rootDecksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rootDecksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RootDecksRef = AutoDisposeFutureProviderRef<List<Deck>>;
String _$childDecksHash() => r'229fcc6e8d195e54eef56018cfcac0b31d9b117d';

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

/// Provider for child decks of a specific parent deck
///
/// Copied from [childDecks].
@ProviderFor(childDecks)
const childDecksProvider = ChildDecksFamily();

/// Provider for child decks of a specific parent deck
///
/// Copied from [childDecks].
class ChildDecksFamily extends Family<AsyncValue<List<Deck>>> {
  /// Provider for child decks of a specific parent deck
  ///
  /// Copied from [childDecks].
  const ChildDecksFamily();

  /// Provider for child decks of a specific parent deck
  ///
  /// Copied from [childDecks].
  ChildDecksProvider call(String parentDeckId) {
    return ChildDecksProvider(parentDeckId);
  }

  @override
  ChildDecksProvider getProviderOverride(
    covariant ChildDecksProvider provider,
  ) {
    return call(provider.parentDeckId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'childDecksProvider';
}

/// Provider for child decks of a specific parent deck
///
/// Copied from [childDecks].
class ChildDecksProvider extends AutoDisposeFutureProvider<List<Deck>> {
  /// Provider for child decks of a specific parent deck
  ///
  /// Copied from [childDecks].
  ChildDecksProvider(String parentDeckId)
    : this._internal(
        (ref) => childDecks(ref as ChildDecksRef, parentDeckId),
        from: childDecksProvider,
        name: r'childDecksProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$childDecksHash,
        dependencies: ChildDecksFamily._dependencies,
        allTransitiveDependencies: ChildDecksFamily._allTransitiveDependencies,
        parentDeckId: parentDeckId,
      );

  ChildDecksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parentDeckId,
  }) : super.internal();

  final String parentDeckId;

  @override
  Override overrideWith(
    FutureOr<List<Deck>> Function(ChildDecksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChildDecksProvider._internal(
        (ref) => create(ref as ChildDecksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parentDeckId: parentDeckId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Deck>> createElement() {
    return _ChildDecksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChildDecksProvider && other.parentDeckId == parentDeckId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parentDeckId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChildDecksRef on AutoDisposeFutureProviderRef<List<Deck>> {
  /// The parameter `parentDeckId` of this provider.
  String get parentDeckId;
}

class _ChildDecksProviderElement
    extends AutoDisposeFutureProviderElement<List<Deck>>
    with ChildDecksRef {
  _ChildDecksProviderElement(super.provider);

  @override
  String get parentDeckId => (origin as ChildDecksProvider).parentDeckId;
}

String _$userCardsHash() => r'eaa7901fb60c0a93d0cf9bdbc9700328d4112d84';

/// Provider for user's cards
///
/// Copied from [userCards].
@ProviderFor(userCards)
final userCardsProvider = AutoDisposeFutureProvider<List<FlashCard>>.internal(
  userCards,
  name: r'userCardsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserCardsRef = AutoDisposeFutureProviderRef<List<FlashCard>>;
String _$deckCardsHash() => r'a3f8794049af91e00bde0319b55ecac87b1050df';

/// Provider for cards in a specific deck
///
/// Copied from [deckCards].
@ProviderFor(deckCards)
const deckCardsProvider = DeckCardsFamily();

/// Provider for cards in a specific deck
///
/// Copied from [deckCards].
class DeckCardsFamily extends Family<AsyncValue<List<FlashCard>>> {
  /// Provider for cards in a specific deck
  ///
  /// Copied from [deckCards].
  const DeckCardsFamily();

  /// Provider for cards in a specific deck
  ///
  /// Copied from [deckCards].
  DeckCardsProvider call(String deckId) {
    return DeckCardsProvider(deckId);
  }

  @override
  DeckCardsProvider getProviderOverride(covariant DeckCardsProvider provider) {
    return call(provider.deckId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deckCardsProvider';
}

/// Provider for cards in a specific deck
///
/// Copied from [deckCards].
class DeckCardsProvider extends AutoDisposeFutureProvider<List<FlashCard>> {
  /// Provider for cards in a specific deck
  ///
  /// Copied from [deckCards].
  DeckCardsProvider(String deckId)
    : this._internal(
        (ref) => deckCards(ref as DeckCardsRef, deckId),
        from: deckCardsProvider,
        name: r'deckCardsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$deckCardsHash,
        dependencies: DeckCardsFamily._dependencies,
        allTransitiveDependencies: DeckCardsFamily._allTransitiveDependencies,
        deckId: deckId,
      );

  DeckCardsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.deckId,
  }) : super.internal();

  final String deckId;

  @override
  Override overrideWith(
    FutureOr<List<FlashCard>> Function(DeckCardsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeckCardsProvider._internal(
        (ref) => create(ref as DeckCardsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        deckId: deckId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FlashCard>> createElement() {
    return _DeckCardsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeckCardsProvider && other.deckId == deckId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, deckId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeckCardsRef on AutoDisposeFutureProviderRef<List<FlashCard>> {
  /// The parameter `deckId` of this provider.
  String get deckId;
}

class _DeckCardsProviderElement
    extends AutoDisposeFutureProviderElement<List<FlashCard>>
    with DeckCardsRef {
  _DeckCardsProviderElement(super.provider);

  @override
  String get deckId => (origin as DeckCardsProvider).deckId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
