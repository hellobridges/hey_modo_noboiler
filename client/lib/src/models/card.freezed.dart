// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FlashCard _$FlashCardFromJson(Map<String, dynamic> json) {
  return _FlashCard.fromJson(json);
}

/// @nodoc
mixin _$FlashCard {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_type')
  CardType get cardType => throw _privateConstructorUsedError;
  String get front => throw _privateConstructorUsedError;
  String get back => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<String> get mediaIds => throw _privateConstructorUsedError;
  List<String> get tagIds => throw _privateConstructorUsedError;

  /// Serializes this FlashCard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashCardCopyWith<FlashCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashCardCopyWith<$Res> {
  factory $FlashCardCopyWith(FlashCard value, $Res Function(FlashCard) then) =
      _$FlashCardCopyWithImpl<$Res, FlashCard>;
  @useResult
  $Res call({
    String id,
    String userId,
    @JsonKey(name: 'card_type') CardType cardType,
    String front,
    String back,
    @JsonKey(name: 'data') Map<String, dynamic> data,
    @JsonKey(name: 'created_at') DateTime createdAt,
    List<String> mediaIds,
    List<String> tagIds,
  });
}

/// @nodoc
class _$FlashCardCopyWithImpl<$Res, $Val extends FlashCard>
    implements $FlashCardCopyWith<$Res> {
  _$FlashCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? cardType = null,
    Object? front = null,
    Object? back = null,
    Object? data = null,
    Object? createdAt = null,
    Object? mediaIds = null,
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
            cardType:
                null == cardType
                    ? _value.cardType
                    : cardType // ignore: cast_nullable_to_non_nullable
                        as CardType,
            front:
                null == front
                    ? _value.front
                    : front // ignore: cast_nullable_to_non_nullable
                        as String,
            back:
                null == back
                    ? _value.back
                    : back // ignore: cast_nullable_to_non_nullable
                        as String,
            data:
                null == data
                    ? _value.data
                    : data // ignore: cast_nullable_to_non_nullable
                        as Map<String, dynamic>,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            mediaIds:
                null == mediaIds
                    ? _value.mediaIds
                    : mediaIds // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FlashCardImplCopyWith<$Res>
    implements $FlashCardCopyWith<$Res> {
  factory _$$FlashCardImplCopyWith(
    _$FlashCardImpl value,
    $Res Function(_$FlashCardImpl) then,
  ) = __$$FlashCardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    @JsonKey(name: 'card_type') CardType cardType,
    String front,
    String back,
    @JsonKey(name: 'data') Map<String, dynamic> data,
    @JsonKey(name: 'created_at') DateTime createdAt,
    List<String> mediaIds,
    List<String> tagIds,
  });
}

/// @nodoc
class __$$FlashCardImplCopyWithImpl<$Res>
    extends _$FlashCardCopyWithImpl<$Res, _$FlashCardImpl>
    implements _$$FlashCardImplCopyWith<$Res> {
  __$$FlashCardImplCopyWithImpl(
    _$FlashCardImpl _value,
    $Res Function(_$FlashCardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? cardType = null,
    Object? front = null,
    Object? back = null,
    Object? data = null,
    Object? createdAt = null,
    Object? mediaIds = null,
    Object? tagIds = null,
  }) {
    return _then(
      _$FlashCardImpl(
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
        cardType:
            null == cardType
                ? _value.cardType
                : cardType // ignore: cast_nullable_to_non_nullable
                    as CardType,
        front:
            null == front
                ? _value.front
                : front // ignore: cast_nullable_to_non_nullable
                    as String,
        back:
            null == back
                ? _value.back
                : back // ignore: cast_nullable_to_non_nullable
                    as String,
        data:
            null == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as Map<String, dynamic>,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        mediaIds:
            null == mediaIds
                ? _value._mediaIds
                : mediaIds // ignore: cast_nullable_to_non_nullable
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
class _$FlashCardImpl with DiagnosticableTreeMixin implements _FlashCard {
  const _$FlashCardImpl({
    required this.id,
    required this.userId,
    @JsonKey(name: 'card_type') required this.cardType,
    required this.front,
    required this.back,
    @JsonKey(name: 'data') required final Map<String, dynamic> data,
    @JsonKey(name: 'created_at') required this.createdAt,
    final List<String> mediaIds = const [],
    final List<String> tagIds = const [],
  }) : _data = data,
       _mediaIds = mediaIds,
       _tagIds = tagIds;

  factory _$FlashCardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashCardImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  @JsonKey(name: 'card_type')
  final CardType cardType;
  @override
  final String front;
  @override
  final String back;
  final Map<String, dynamic> _data;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<String> _mediaIds;
  @override
  @JsonKey()
  List<String> get mediaIds {
    if (_mediaIds is EqualUnmodifiableListView) return _mediaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaIds);
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
    return 'FlashCard(id: $id, userId: $userId, cardType: $cardType, front: $front, back: $back, data: $data, createdAt: $createdAt, mediaIds: $mediaIds, tagIds: $tagIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlashCard'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('cardType', cardType))
      ..add(DiagnosticsProperty('front', front))
      ..add(DiagnosticsProperty('back', back))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('mediaIds', mediaIds))
      ..add(DiagnosticsProperty('tagIds', tagIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashCardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.cardType, cardType) ||
                other.cardType == cardType) &&
            (identical(other.front, front) || other.front == front) &&
            (identical(other.back, back) || other.back == back) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._mediaIds, _mediaIds) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    cardType,
    front,
    back,
    const DeepCollectionEquality().hash(_data),
    createdAt,
    const DeepCollectionEquality().hash(_mediaIds),
    const DeepCollectionEquality().hash(_tagIds),
  );

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      __$$FlashCardImplCopyWithImpl<_$FlashCardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashCardImplToJson(this);
  }
}

abstract class _FlashCard implements FlashCard {
  const factory _FlashCard({
    required final String id,
    required final String userId,
    @JsonKey(name: 'card_type') required final CardType cardType,
    required final String front,
    required final String back,
    @JsonKey(name: 'data') required final Map<String, dynamic> data,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    final List<String> mediaIds,
    final List<String> tagIds,
  }) = _$FlashCardImpl;

  factory _FlashCard.fromJson(Map<String, dynamic> json) =
      _$FlashCardImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  @JsonKey(name: 'card_type')
  CardType get cardType;
  @override
  String get front;
  @override
  String get back;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic> get data;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  List<String> get mediaIds;
  @override
  List<String> get tagIds;

  /// Create a copy of FlashCard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashCardImplCopyWith<_$FlashCardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
