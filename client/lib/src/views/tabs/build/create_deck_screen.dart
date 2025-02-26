import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';
import '../../../services/flashcard_service.dart';
import 'deck_form.dart';

/// Screen for creating a new deck
class CreateDeckScreen extends ConsumerStatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  ConsumerState<CreateDeckScreen> createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends ConsumerState<CreateDeckScreen> {
  bool _isLoading = false;
  String? _errorMessage;
  
  Future<void> _createDeck({
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
      
      await flashcardService.createDeck(
        title: title,
        description: description,
        metadata: metadata,
        parentDeckId: parentDeckId,
      );
      
      // Refresh the root decks list
      ref.refresh(rootDecksProvider);
      
      // Refresh the child decks for the parent if it exists
      if (parentDeckId != null) {
        ref.refresh(childDecksProvider(parentDeckId));
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Deck created successfully'),
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
      title: 'Create Deck',
      onSubmit: _createDeck,
      onCancel: () => Navigator.of(context).pop(),
      submitButtonText: 'Create',
      isLoading: _isLoading,
      errorMessage: _errorMessage,
    );
  }
} 