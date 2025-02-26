import 'package:flutter/material.dart';
import '../../services/supabase_service.dart';

/// Service class for handling authentication-related operations.
class AuthService {
  /// Private constructor for singleton pattern
  AuthService._();

  /// Singleton instance
  static final AuthService _instance = AuthService._();

  /// Factory constructor to return the singleton instance
  factory AuthService() => _instance;

  /// Reference to the Supabase service
  final SupabaseService _supabaseService = SupabaseService();

  /// Sign up a new user with email and password
  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseService.signUp(
        email: email,
        password: password,
      );
      
      if (response.user != null) {
        debugPrint('User signed up successfully: ${response.user!.email}');
        return true;
      } else {
        debugPrint('Sign up failed: ${response.session}');
        return false;
      }
    } catch (e) {
      debugPrint('Error during sign up: $e');
      return false;
    }
  }

  /// Sign in a user with email and password
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseService.signIn(
        email: email,
        password: password,
      );
      
      if (response.user != null) {
        debugPrint('User signed in successfully: ${response.user!.email}');
        return true;
      } else {
        debugPrint('Sign in failed: ${response.session}');
        return false;
      }
    } catch (e) {
      debugPrint('Error during sign in: $e');
      return false;
    }
  }

  /// Sign out the current user
  Future<void> signOut() async {
    try {
      await _supabaseService.signOut();
      debugPrint('User signed out successfully');
    } catch (e) {
      debugPrint('Error during sign out: $e');
      rethrow;
    }
  }

  /// Check if a user is currently authenticated
  bool get isAuthenticated => _supabaseService.isAuthenticated;

  /// Get the current user if logged in
  get currentUser => _supabaseService.currentUser;
} 