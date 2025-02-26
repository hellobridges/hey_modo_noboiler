// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeckImpl _$$DeckImplFromJson(Map<String, dynamic> json) => _$DeckImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>,
  parentDeckId: json['parent_deck_id'] as String?,
  cardIds:
      (json['cardIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tagIds:
      (json['tagIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$DeckImplToJson(_$DeckImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
      'parent_deck_id': instance.parentDeckId,
      'cardIds': instance.cardIds,
      'tagIds': instance.tagIds,
    };
