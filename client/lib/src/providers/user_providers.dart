import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';
import '../services/user_service.dart';

part 'user_providers.g.dart';

/// Provider for the UserService
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

/// Provider for users with deck counts for the leaderboard
@riverpod
Future<List<AppUser>> usersWithDeckCounts(UsersWithDeckCountsRef ref) async {
  final userService = ref.watch(userServiceProvider);
  return await userService.getUsersWithDeckCounts();
} 