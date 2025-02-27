import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/user.dart';
import '../../../providers/user_providers.dart';

/// Widget that displays a leaderboard of users based on their deck count
class LeaderboardWidget extends ConsumerWidget {
  const LeaderboardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersWithDeckCountsProvider);

    return usersAsync.when(
      data: (users) => _buildLeaderboard(context, users),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: SelectableText.rich(
          TextSpan(
            text: 'Error loading leaderboard: ',
            style: const TextStyle(color: Colors.red),
            children: [
              TextSpan(
                text: error.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboard(BuildContext context, List<AppUser> users) {
    if (users.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Leaderboard',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return _buildUserListItem(context, user, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserListItem(BuildContext context, AppUser user, int index) {
    // Determine if this user gets a trophy (top 3)
    Widget? trophy;
    if (index == 0) {
      trophy = const Icon(Icons.emoji_events, color: Colors.amber, size: 24);
    } else if (index == 1) {
      trophy = const Icon(Icons.emoji_events, color: Colors.grey, size: 24);
    } else if (index == 2) {
      trophy = const Icon(Icons.emoji_events, color: Colors.brown, size: 24);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: trophy,
        title: Text(
          user.name ?? user.email.split('@').first,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          '${user.deckCount} ${user.deckCount == 1 ? 'deck' : 'decks'}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
} 