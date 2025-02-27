import 'package:flutter/foundation.dart';
import '../models/user.dart';
import 'supabase_service.dart';

/// Service class for handling user-related operations.
class UserService {
  /// Private constructor for singleton pattern
  UserService._();

  /// Singleton instance
  static final UserService _instance = UserService._();

  /// Factory constructor to return the singleton instance
  factory UserService() => _instance;

  /// Reference to the Supabase service
  final SupabaseService _supabaseService = SupabaseService();

  /// Get all users with their deck counts for the leaderboard
  Future<List<AppUser>> getUsersWithDeckCounts() async {
    try {
      // Query to get users and count their decks
      final response = await _supabaseService.client
          .rpc('get_users_with_deck_counts');
          
      debugPrint('Successfully fetched users with deck counts: ${response.length}');

      // Convert the response to AppUser objects
      final users = (response as List).map((userJson) {
        // Ensure the JSON has the expected structure
        final Map<String, dynamic> safeJson = {
          'id': userJson['id'],
          'email': userJson['email'] ?? '',
          'name': userJson['name'] ?? userJson['email']?.toString().split('@').first ?? 'User',
          'deckCount': userJson['deck_count'] ?? 0,
          'avatarUrl': userJson['avatar_url'],
        };
        
        return AppUser.fromJson(safeJson);
      }).toList();

      // Sort users by deck count in descending order
      users.sort((a, b) => b.deckCount.compareTo(a.deckCount));

      return users;
    } catch (e) {
      debugPrint('Error fetching users with deck counts: $e');
      
      // For development/testing, return a list with a single user if the RPC fails
      // This is because we might not have the RPC function set up yet
      return [
        AppUser(
          id: _supabaseService.currentUser?.id ?? 'test-user-id',
          email: _supabaseService.currentUser?.email ?? 'test@example.com',
          name: 'Test User',
          deckCount: 5,
        )
      ];
    }
  }
} 