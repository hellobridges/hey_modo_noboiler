import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';

/// The Learn tab of the application.
class LearnTab extends ConsumerWidget {
  const LearnTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final decksAsync = ref.watch(userDecksProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(userDecksProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: decksAsync.when(
        data: (decks) => _buildDecksList(context, decks, ref),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorWidget(context, error, ref),
      ),
    );
  }

  Widget _buildDecksList(BuildContext context, List<Deck> decks, WidgetRef ref) {
    if (decks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.library_books,
              size: 60,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'No Decks Found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your first deck in the Build tab',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => ref.refresh(userDecksProvider),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(deck.title),
              subtitle: Text(
                deck.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                '${deck.cardIds.length} cards',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                // TODO: Navigate to deck detail screen
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context, Object error, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            'Error loading decks',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SelectableText.rich(
              TextSpan(
                text: error.toString(),
                style: const TextStyle(color: Colors.red),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(userDecksProvider),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
} 