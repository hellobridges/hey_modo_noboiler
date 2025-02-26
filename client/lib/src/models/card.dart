import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'card.freezed.dart';
part 'card.g.dart';

/// Enum for card types
enum CardType {
  @JsonValue('standard')
  standard,
  @JsonValue('cloze')
  cloze,
  @JsonValue('typed')
  typed,
  @JsonValue('image_occlusion')
  imageOcclusion,
}

/// FlashCard model representing a flashcard
@freezed
class FlashCard with _$FlashCard {
  const factory FlashCard({
    required String id,
    required String userId,
    @JsonKey(name: 'card_type') required CardType cardType,
    required String front,
    required String back,
    @JsonKey(name: 'data') required Map<String, dynamic> data,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default([]) List<String> mediaIds,
    @Default([]) List<String> tagIds,
  }) = _FlashCard;

  factory FlashCard.fromJson(Map<String, dynamic> json) => _$FlashCardFromJson(json);
} 