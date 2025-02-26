import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'deck.freezed.dart';
part 'deck.g.dart';

/// Deck model representing a collection of flashcards
@freezed
class Deck with _$Deck {
  const factory Deck({
    required String id,
    required String userId,
    required String title,
    required String description,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'metadata') required Map<String, dynamic> metadata,
    @JsonKey(name: 'parent_deck_id') String? parentDeckId,
    @Default([]) List<String> cardIds,
    @Default([]) List<String> tagIds,
  }) = _Deck;

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);
} 