import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';
import 'deck_form.dart';

/// Screen for editing an existing deck
class EditDeckScreen extends ConsumerStatefulWidget {
  /// The deck to edit
  final Deck deck;

  const EditDeckScreen({
    super.key,
    required this.deck,
  });

  @override
  ConsumerState<EditDeckScreen> createState() => _EditDeckScreenState();
}

class _EditDeckScreenState extends ConsumerState<EditDeckScreen> {
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _updateDeck({
    required String title,
    required String description,
    required Map<String, dynamic> metadata,
    String? parentDeckId,
  }) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final flashcardService = ref.read(flashcardServiceProvider);
      
      // Store the previous parent deck ID before updating
      final String? previousParentDeckId = widget.deck.parentDeckId;

      await flashcardService.updateDeck(
        deckId: widget.deck.id,
        title: title,
        description: description,
        metadata: metadata,
        parentDeckId: parentDeckId,
      );

      // Refresh the root decks list
      ref.refresh(rootDecksProvider);
      
      // Refresh the child decks for the previous parent if it exists
      if (previousParentDeckId != null) {
        ref.refresh(childDecksProvider(previousParentDeckId));
      }
      
      // Refresh the child decks for the new parent if it exists and is different
      if (parentDeckId != null && parentDeckId != previousParentDeckId) {
        ref.refresh(childDecksProvider(parentDeckId));
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Deck updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DeckForm(
      title: 'Edit Deck',
      deck: widget.deck,
      onSubmit: _updateDeck,
      onCancel: () => Navigator.of(context).pop(),
      submitButtonText: 'Save Changes',
      isLoading: _isLoading,
      errorMessage: _errorMessage,
    );
  }
} 