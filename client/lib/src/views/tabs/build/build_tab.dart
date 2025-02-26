import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';
import '../../../widgets/user_settings_menu.dart';
import 'create_deck_screen.dart';
import 'edit_deck_screen.dart';

/// The Build tab of the application.
class BuildTab extends ConsumerWidget {
  const BuildTab({super.key});

  /// Refreshes all deck-related providers
  void _refreshAllDecks(WidgetRef ref, List<Deck> rootDecks) {
    // Refresh root decks
    ref.refresh(rootDecksProvider);
    
    // Refresh user decks
    ref.refresh(userDecksProvider);
    
    // Refresh child decks for each root deck
    for (final deck in rootDecks) {
      ref.refresh(childDecksProvider(deck.id));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootDecksAsync = ref.watch(rootDecksProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          UserSettingsMenu(),
        ],
      ),
      body: rootDecksAsync.when(
        data: (decks) => _buildDecksList(context, decks, ref),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => _buildErrorWidget(context, error, ref),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateDeckScreen(),
            ),
          );
        },
        tooltip: 'Create Deck',
        child: const Icon(Icons.add),
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
              Icons.folder,
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
              'Create your first deck by tapping the + button',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        _refreshAllDecks(ref, decks);
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: decks.length,
        itemBuilder: (context, index) {
          final deck = decks[index];
          return _buildDeckItem(context, deck, ref);
        },
      ),
    );
  }

  Widget _buildDeckItem(BuildContext context, Deck deck, WidgetRef ref) {
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
      child: ExpansionTile(
        title: Text(deck.title),
        subtitle: Text(
          deck.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Icon(iconData, color: color),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Edit button
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit Deck',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditDeckScreen(deck: deck),
                  ),
                );
              },
            ),
            // Dropdown icon (part of ExpansionTile)
            const Icon(Icons.expand_more),
          ],
        ),
        children: [
          _buildChildDecks(context, deck.id, ref),
        ],
      ),
    );
  }

  Widget _buildChildDecks(BuildContext context, String parentDeckId, WidgetRef ref) {
    final childDecksAsync = ref.watch(childDecksProvider(parentDeckId));
    
    return childDecksAsync.when(
      data: (childDecks) {
        if (childDecks.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No child decks'),
          );
        }
        
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: childDecks.length,
          itemBuilder: (context, index) {
            final childDeck = childDecks[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: _buildDeckItem(context, childDeck, ref),
            );
          },
        );
      },
      loading: () => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Error loading child decks: $error'),
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
            size: 60,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Error Loading Decks',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => ref.refresh(rootDecksProvider),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
} 