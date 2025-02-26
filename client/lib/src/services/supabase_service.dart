import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Service class for interacting with Supabase.
class SupabaseService {
  /// Private constructor for singleton pattern
  SupabaseService._();

  /// Singleton instance
  static final SupabaseService _instance = SupabaseService._();

  /// Factory constructor to return the singleton instance
  factory SupabaseService() => _instance;

  /// Supabase client instance
  late final SupabaseClient _client;

  /// Getter for the Supabase client
  SupabaseClient get client => _client;

  /// Initialize Supabase with credentials from .env file
  Future<void> initialize() async {
    try {
      await dotenv.load();
      
      final supabaseUrl = dotenv.env['SUPABASE_URL'];
      final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
      
      if (supabaseUrl == null || supabaseAnonKey == null) {
        throw Exception('Supabase credentials not found in .env file');
      }
      
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseAnonKey,
        debug: kDebugMode,
      );
      
      _client = Supabase.instance.client;
      debugPrint('Supabase initialized successfully');
    } catch (e) {
      debugPrint('Error initializing Supabase: $e');
      rethrow;
    }
  }

  /// Get the current user if logged in
  User? get currentUser => _client.auth.currentUser;

  /// Check if a user is currently authenticated
  bool get isAuthenticated => currentUser != null;

  /// Sign up a new user with email and password
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signUp(
      email: email,
      password: password,
    );
  }

  /// Sign in a user with email and password
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  /// Sign out the current user
  Future<void> signOut() async {
    await _client.auth.signOut();
  }
} 