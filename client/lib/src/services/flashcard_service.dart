import 'package:flutter/foundation.dart';
import '../models/card.dart';
import '../models/deck.dart';
import 'supabase_service.dart';

/// Service class for handling flashcard-related operations.
class FlashcardService {
  /// Private constructor for singleton pattern
  FlashcardService._();

  /// Singleton instance
  static final FlashcardService _instance = FlashcardService._();

  /// Factory constructor to return the singleton instance
  factory FlashcardService() => _instance;

  /// Reference to the Supabase service
  final SupabaseService _supabaseService = SupabaseService();

  /// Get all decks for the current user
  Future<List<Deck>> getUserDecks() async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Fetching decks for user: $userId');
      
      // Use the fc_decks table in the public schema
      final response = await _supabaseService.client
          .from('fc_decks')
          .select()
          .eq('user_id', userId);
          
      debugPrint('Successfully fetched decks: ${response.length}');

      // Safely convert the response to Deck objects
      final decks = (response as List).map((deckJson) {
        // Ensure the JSON has the expected structure
        final Map<String, dynamic> safeJson = {
          'id': deckJson['id'],
          'userId': deckJson['user_id'],
          'title': deckJson['title'] ?? '',
          'description': deckJson['description'] ?? '',
          'created_at': deckJson['created_at'],
          'metadata': deckJson['metadata'] ?? {},
          'parent_deck_id': deckJson['parent_deck_id'],
          'cardIds': [],
          'tagIds': [],
        };
        
        return Deck.fromJson(safeJson);
      }).toList();

      return decks;
    } catch (e) {
      debugPrint('Error fetching user decks: $e');
      rethrow;
    }
  }

  /// Get root decks (decks with no parent) for the current user
  Future<List<Deck>> getRootDecks() async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Fetching root decks for user: $userId');
      
      // Get all decks for the user
      final response = await _supabaseService.client
          .from('fc_decks')
          .select()
          .eq('user_id', userId);
          
      debugPrint('Successfully fetched decks: ${response.length}');

      // Safely convert the response to Deck objects
      final allDecks = (response as List).map((deckJson) {
        // Ensure the JSON has the expected structure
        final Map<String, dynamic> safeJson = {
          'id': deckJson['id'],
          'userId': deckJson['user_id'],
          'title': deckJson['title'] ?? '',
          'description': deckJson['description'] ?? '',
          'created_at': deckJson['created_at'],
          'metadata': deckJson['metadata'] ?? {},
          'parent_deck_id': deckJson['parent_deck_id'],
          'cardIds': [],
          'tagIds': [],
        };
        
        return Deck.fromJson(safeJson);
      }).toList();
      
      // Filter for decks with null parent_deck_id
      final rootDecks = allDecks.where((deck) => deck.parentDeckId == null).toList();

      debugPrint('Root decks count: ${rootDecks.length}');
      return rootDecks;
    } catch (e) {
      debugPrint('Error fetching root decks: $e');
      rethrow;
    }
  }

  /// Get child decks for a specific parent deck
  Future<List<Deck>> getChildDecks(String parentDeckId) async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Fetching child decks for parent: $parentDeckId');
      
      // Get all decks for the user
      final response = await _supabaseService.client
          .from('fc_decks')
          .select()
          .eq('user_id', userId)
          .eq('parent_deck_id', parentDeckId);
          
      debugPrint('Successfully fetched child decks: ${response.length}');

      // Safely convert the response to Deck objects
      final childDecks = (response as List).map((deckJson) {
        // Ensure the JSON has the expected structure
        final Map<String, dynamic> safeJson = {
          'id': deckJson['id'],
          'userId': deckJson['user_id'],
          'title': deckJson['title'] ?? '',
          'description': deckJson['description'] ?? '',
          'created_at': deckJson['created_at'],
          'metadata': deckJson['metadata'] ?? {},
          'parent_deck_id': deckJson['parent_deck_id'],
          'cardIds': [],
          'tagIds': [],
        };
        
        return Deck.fromJson(safeJson);
      }).toList();

      debugPrint('Child decks count for $parentDeckId: ${childDecks.length}');
      return childDecks;
    } catch (e) {
      debugPrint('Error fetching child decks: $e');
      rethrow;
    }
  }

  /// Get all cards for the current user
  Future<List<FlashCard>> getUserCards() async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Fetching cards for user: $userId');
      
      // Use the new fc_cards table in the public schema
      final response = await _supabaseService.client
          .from('fc_cards')
          .select()
          .eq('user_id', userId);
          
      debugPrint('Successfully fetched cards: ${response.length}');

      final cards = (response as List)
          .map((cardJson) => FlashCard.fromJson(cardJson as Map<String, dynamic>))
          .toList();

      return cards;
    } catch (e) {
      debugPrint('Error fetching user cards: $e');
      rethrow;
    }
  }

  /// Get all cards for a specific deck
  Future<List<FlashCard>> getCardsForDeck(String deckId) async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Fetching cards for deck: $deckId');
      
      // First get the card IDs from the link table
      final deckCardsResponse = await _supabaseService.client
          .from('fc_link_cards_decks')
          .select('card_id')
          .eq('deck_id', deckId);
          
      debugPrint('Successfully fetched deck_cards: ${deckCardsResponse.length}');

      // Extract the card IDs
      final cardIds = (deckCardsResponse as List)
          .map((item) => item['card_id'] as String)
          .toList();

      if (cardIds.isEmpty) {
        return [];
      }

      // Then fetch the actual cards
      final cardsResponse = await _supabaseService.client
          .from('fc_cards')
          .select()
          .inFilter('id', cardIds)
          .eq('user_id', userId);
          
      debugPrint('Successfully fetched cards: ${cardsResponse.length}');

      final cards = (cardsResponse as List)
          .map((cardJson) => FlashCard.fromJson(cardJson as Map<String, dynamic>))
          .toList();

      return cards;
    } catch (e) {
      debugPrint('Error fetching cards for deck: $e');
      rethrow;
    }
  }
  
  /// Create a new deck for the current user
  Future<Deck> createDeck({
    required String title,
    required String description,
    required Map<String, dynamic> metadata,
    String? parentDeckId,
  }) async {
    try {
      final userId = _supabaseService.currentUser?.id;
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      debugPrint('Creating new deck for user: $userId');
      
      final deckData = {
        'user_id': userId,
        'title': title,
        'description': description,
        'metadata': metadata,
        'parent_deck_id': parentDeckId,
      };
      
      final response = await _supabaseService.client
          .from('fc_decks')
          .insert(deckData)
          .select()
          .single();
          
      debugPrint('Successfully created deck: ${response['id']}');

      // Convert the response to a Deck object
      final Map<String, dynamic> safeJson = {
        'id': response['id'],
        'userId': response['user_id'],
        'title': response['title'] ?? '',
        'description': response['description'] ?? '',
        'created_at': response['created_at'],
        'metadata': response['metadata'] ?? {},
        'parent_deck_id': response['parent_deck_id'],
        'cardIds': [],
        'tagIds': [],
      };
      
      return Deck.fromJson(safeJson);
    } catch (e) {
      debugPrint('Error creating deck: $e');
      rethrow;
    }
  }
} 