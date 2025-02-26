import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/card.dart';
import '../models/deck.dart';
import '../services/flashcard_service.dart';

part 'flashcard_providers.g.dart';

/// Provider for the FlashcardService
final flashcardServiceProvider = Provider<FlashcardService>((ref) {
  return FlashcardService();
});

/// Provider for user's decks
@riverpod
Future<List<Deck>> userDecks(UserDecksRef ref) async {
  final flashcardService = ref.watch(flashcardServiceProvider);
  return await flashcardService.getUserDecks();
}

/// Provider for root decks (decks with no parent)
@riverpod
Future<List<Deck>> rootDecks(RootDecksRef ref) async {
  final flashcardService = ref.watch(flashcardServiceProvider);
  return await flashcardService.getRootDecks();
}

/// Provider for child decks of a specific parent deck
@riverpod
Future<List<Deck>> childDecks(ChildDecksRef ref, String parentDeckId) async {
  final flashcardService = ref.watch(flashcardServiceProvider);
  return await flashcardService.getChildDecks(parentDeckId);
}

/// Provider for user's cards
@riverpod
Future<List<FlashCard>> userCards(UserCardsRef ref) async {
  final flashcardService = ref.watch(flashcardServiceProvider);
  return await flashcardService.getUserCards();
}

/// Provider for cards in a specific deck
@riverpod
Future<List<FlashCard>> deckCards(DeckCardsRef ref, String deckId) async {
  final flashcardService = ref.watch(flashcardServiceProvider);
  return await flashcardService.getCardsForDeck(deckId);
} 