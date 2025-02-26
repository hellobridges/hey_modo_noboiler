// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Deck _$DeckFromJson(Map<String, dynamic> json) {
  return _Deck.fromJson(json);
}

/// @nodoc
mixin _$Deck {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'metadata')
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_deck_id')
  String? get parentDeckId => throw _privateConstructorUsedError;
  List<String> get cardIds => throw _privateConstructorUsedError;
  List<String> get tagIds => throw _privateConstructorUsedError;

  /// Serializes this Deck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeckCopyWith<Deck> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) then) =
      _$DeckCopyWithImpl<$Res, Deck>;
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
    @JsonKey(name: 'parent_deck_id') String? parentDeckId,
    List<String> cardIds,
    List<String> tagIds,
  });
}

/// @nodoc
class _$DeckCopyWithImpl<$Res, $Val extends Deck>
    implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? metadata = null,
    Object? parentDeckId = freezed,
    Object? cardIds = null,
    Object? tagIds = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            userId:
                null == userId
                    ? _value.userId
                    : userId // ignore: cast_nullable_to_non_nullable
                        as String,
            title:
                null == title
                    ? _value.title
                    : title // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            metadata:
                null == metadata
                    ? _value.metadata
                    : metadata // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            parentDeckId:
                freezed == parentDeckId
                    ? _value.parentDeckId
                    : parentDeckId // ignore: cast_nullable_to_non_nullable
                        as String?,
            cardIds:
                null == cardIds
                    ? _value.cardIds
                    : cardIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            tagIds:
                null == tagIds
                    ? _value.tagIds
                    : tagIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeckImplCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$$DeckImplCopyWith(
    _$DeckImpl value,
    $Res Function(_$DeckImpl) then,
  ) = __$$DeckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String title,
    String description,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'metadata') Map<String, dynamic> metadata,
    @JsonKey(name: 'parent_deck_id') String? parentDeckId,
    List<String> cardIds,
    List<String> tagIds,
  });
}

/// @nodoc
class __$$DeckImplCopyWithImpl<$Res>
    extends _$DeckCopyWithImpl<$Res, _$DeckImpl>
    implements _$$DeckImplCopyWith<$Res> {
  __$$DeckImplCopyWithImpl(_$DeckImpl _value, $Res Function(_$DeckImpl) _then)
    : super(_value, _then);

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? createdAt = null,
    Object? metadata = null,
    Object? parentDeckId = freezed,
    Object? cardIds = null,
    Object? tagIds = null,
  }) {
    return _then(
      _$DeckImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        userId:
            null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                    as String,
        title:
            null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        metadata:
            null == metadata
                ? _value._metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        parentDeckId:
            freezed == parentDeckId
                ? _value.parentDeckId
                : parentDeckId // ignore: cast_nullable_to_non_nullable
                    as String?,
        cardIds:
            null == cardIds
                ? _value._cardIds
                : cardIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        tagIds:
            null == tagIds
                ? _value._tagIds
                : tagIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeckImpl with DiagnosticableTreeMixin implements _Deck {
  const _$DeckImpl({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'metadata') required final Map<String, dynamic> metadata,
    @JsonKey(name: 'parent_deck_id') this.parentDeckId,
    final List<String> cardIds = const [],
    final List<String> tagIds = const [],
  }) : _metadata = metadata,
       _cardIds = cardIds,
       _tagIds = tagIds;

  factory _$DeckImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeckImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final Map<String, dynamic> _metadata;
  @override
  @JsonKey(name: 'metadata')
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  @JsonKey(name: 'parent_deck_id')
  final String? parentDeckId;
  final List<String> _cardIds;
  @override
  @JsonKey()
  List<String> get cardIds {
    if (_cardIds is EqualUnmodifiableListView) return _cardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardIds);
  }

  final List<String> _tagIds;
  @override
  @JsonKey()
  List<String> get tagIds {
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Deck(id: $id, userId: $userId, title: $title, description: $description, createdAt: $createdAt, metadata: $metadata, parentDeckId: $parentDeckId, cardIds: $cardIds, tagIds: $tagIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Deck'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('metadata', metadata))
      ..add(DiagnosticsProperty('parentDeckId', parentDeckId))
      ..add(DiagnosticsProperty('cardIds', cardIds))
      ..add(DiagnosticsProperty('tagIds', tagIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeckImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.parentDeckId, parentDeckId) ||
                other.parentDeckId == parentDeckId) &&
            const DeepCollectionEquality().equals(other._cardIds, _cardIds) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    title,
    description,
    createdAt,
    const DeepCollectionEquality().hash(_metadata),
    parentDeckId,
    const DeepCollectionEquality().hash(_cardIds),
    const DeepCollectionEquality().hash(_tagIds),
  );

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeckImplCopyWith<_$DeckImpl> get copyWith =>
      __$$DeckImplCopyWithImpl<_$DeckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeckImplToJson(this);
  }
}

abstract class _Deck implements Deck {
  const factory _Deck({
    required final String id,
    required final String userId,
    required final String title,
    required final String description,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    @JsonKey(name: 'metadata') required final Map<String, dynamic> metadata,
    @JsonKey(name: 'parent_deck_id') final String? parentDeckId,
    final List<String> cardIds,
    final List<String> tagIds,
  }) = _$DeckImpl;

  factory _Deck.fromJson(Map<String, dynamic> json) = _$DeckImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'metadata')
  Map<String, dynamic> get metadata;
  @override
  @JsonKey(name: 'parent_deck_id')
  String? get parentDeckId;
  @override
  List<String> get cardIds;
  @override
  List<String> get tagIds;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeckImplCopyWith<_$DeckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
