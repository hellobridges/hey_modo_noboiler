// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FlashCardImpl _$$FlashCardImplFromJson(
  Map<String, dynamic> json,
) => _$FlashCardImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  cardType: $enumDecode(_$CardTypeEnumMap, json['card_type']),
  front: json['front'] as String,
  back: json['back'] as String,
  data: json['data'] as Map<String, dynamic>,
  createdAt: DateTime.parse(json['created_at'] as String),
  mediaIds:
      (json['mediaIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  tagIds:
      (json['tagIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$FlashCardImplToJson(_$FlashCardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'card_type': _$CardTypeEnumMap[instance.cardType]!,
      'front': instance.front,
      'back': instance.back,
      'data': instance.data,
      'created_at': instance.createdAt.toIso8601String(),
      'mediaIds': instance.mediaIds,
      'tagIds': instance.tagIds,
    };

const _$CardTypeEnumMap = {
  CardType.standard: 'standard',
  CardType.cloze: 'cloze',
  CardType.typed: 'typed',
  CardType.imageOcclusion: 'image_occlusion',
};
