import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';
import '../../../widgets/user_settings_menu.dart';

/// The Learn tab of the application.
class LearnTab extends ConsumerWidget {
  const LearnTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final decksAsync = ref.watch(rootDecksProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          UserSettingsMenu(),
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
      onRefresh: () async => ref.refresh(rootDecksProvider),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return _buildDeckItem(context, deck);
        },
      ),
    );
  }
  
  Widget _buildDeckItem(BuildContext context, Deck deck) {
    // Extract icon and color from metadata
    final iconData = deck.metadata.containsKey('icon')
        ? IconData(
            deck.metadata['icon'] as int,
            fontFamily: deck.metadata['icon_font_family'] as String? ?? 'MaterialIcons',
          )
        : Icons.folder;
    
    final color = deck.metadata.containsKey('color')
        ? Color(deck.metadata['color'] as int)
        : Colors.blue;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(iconData, color: color),
        title: Text(deck.title),
        subtitle: Text(
          deck.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Navigate to deck detail screen
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
                children: [
                  TextSpan(
                    text: 'Error details:\n',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  TextSpan(
                    text: error.toString(),
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(rootDecksProvider),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
} 