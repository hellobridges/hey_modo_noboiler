import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';
import '../views/auth/auth_service.dart';

/// Provider for the AuthService
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

/// Provider for the authentication state
final authStateProvider = StateProvider<bool>((ref) {
  return AuthService().isAuthenticated;
});

/// Provider for the current user
final currentUserProvider = Provider<User?>((ref) {
  return AuthService().currentUser;
});

/// Provider for the Supabase auth state changes
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  return SupabaseService().client.auth.onAuthStateChange;
});

/// Provider for handling auth state changes
final authStateListenerProvider = Provider<void>((ref) {
  // Use ref.listen with a provider that returns a Stream
  final authStateChanges = ref.watch(authStateChangesProvider);
  
  // Handle the AsyncValue state
  authStateChanges.whenData((authState) {
    // Update the auth state when it changes
    ref.read(authStateProvider.notifier).state = authState.session != null;
  });
}); 