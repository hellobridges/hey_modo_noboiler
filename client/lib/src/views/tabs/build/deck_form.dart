import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';

/// A modular form for creating or editing a deck
class DeckForm extends ConsumerStatefulWidget {
  /// The title of the form
  final String title;
  
  /// The deck to edit (null for creating a new deck)
  final Deck? deck;
  
  /// Callback when the form is submitted
  final Future<void> Function({
    required String title,
    required String description,
    required Map<String, dynamic> metadata,
    String? parentDeckId,
  }) onSubmit;
  
  /// Callback when the form is cancelled
  final VoidCallback onCancel;
  
  /// Text for the submit button
  final String submitButtonText;
  
  /// Whether the form is in loading state
  final bool isLoading;
  
  /// Error message to display
  final String? errorMessage;
  
  const DeckForm({
    super.key,
    required this.title,
    this.deck,
    required this.onSubmit,
    required this.onCancel,
    required this.submitButtonText,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  ConsumerState<DeckForm> createState() => _DeckFormState();
}

class _DeckFormState extends ConsumerState<DeckForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  
  // Default icon and color
  late IconData _selectedIcon;
  late Color _selectedColor;
  
  // Parent deck selection
  String? _selectedParentDeckId;
  
  // List of available icons
  final List<IconData> _availableIcons = [
    Icons.folder,
    Icons.book,
    Icons.school,
    Icons.science,
    Icons.history,
    Icons.language,
    Icons.calculate,
    Icons.psychology,
    Icons.sports,
    Icons.music_note,
    Icons.palette,
    Icons.code,
  ];
  
  // List of available colors
  final List<Color> _availableColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.amber,
    Colors.indigo,
    Colors.cyan,
    Colors.deepOrange,
    Colors.lightBlue,
  ];
  
  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing deck data if editing
    _nameController = TextEditingController(text: widget.deck?.title ?? '');
    _descriptionController = TextEditingController(text: widget.deck?.description ?? '');
    
    // Initialize icon and color from deck metadata if editing
    if (widget.deck != null) {
      final metadata = widget.deck!.metadata;
      
      // Set icon
      if (metadata.containsKey('icon')) {
        _selectedIcon = IconData(
          metadata['icon'] as int,
          fontFamily: metadata['icon_font_family'] as String? ?? 'MaterialIcons',
        );
      } else {
        _selectedIcon = Icons.folder;
      }
      
      // Set color
      if (metadata.containsKey('color')) {
        _selectedColor = Color(metadata['color'] as int);
      } else {
        _selectedColor = Colors.blue;
      }
      
      // Set parent deck ID
      _selectedParentDeckId = widget.deck!.parentDeckId;
    } else {
      _selectedIcon = Icons.folder;
      _selectedColor = Colors.blue;
    }
  }
  
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    // Create metadata with icon and color information
    final metadata = {
      'icon': _selectedIcon.codePoint,
      'icon_font_family': 'MaterialIcons',
      'color': _selectedColor.value,
    };
    
    await widget.onSubmit(
      title: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      metadata: metadata,
      parentDeckId: _selectedParentDeckId,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // Change from rootDecksProvider to userDecksProvider to get ALL decks
    final userDecksAsync = ref.watch(userDecksProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Error message
                    if (widget.errorMessage != null)
                      Card(
                        color: Colors.red.shade50,
                        margin: const EdgeInsets.only(bottom: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.error_outline, color: Colors.red),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    'Error',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              SelectableText.rich(
                                TextSpan(
                                  text: widget.errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    
                    // Icon and Name section
                    Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deck Information',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16.0),
                            
                            // Icon selection
                            Center(
                              child: Column(
                                children: [
                                  Icon(
                                    _selectedIcon,
                                    size: 64,
                                    color: _selectedColor,
                                  ),
                                  const SizedBox(height: 8.0),
                                  OutlinedButton.icon(
                                    icon: const Icon(Icons.edit),
                                    label: const Text('Change Icon'),
                                    onPressed: () {
                                      _showIconSelectionDialog();
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            
                            // Color selection
                            Row(
                              children: [
                                const Text('Color:'),
                                const SizedBox(width: 8.0),
                                InkWell(
                                  onTap: () {
                                    _showColorSelectionDialog();
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: _selectedColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: const Icon(
                                      Icons.colorize,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            
                            // Name field
                            TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter deck name',
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a name for the deck';
                                }
                                return null;
                              },
                            ),
                            
                            // Parent deck selection (optional)
                            const SizedBox(height: 16.0),
                            userDecksAsync.when(
                              data: (decks) {
                                // Filter out the current deck if editing to prevent circular references
                                final availableDecks = widget.deck != null
                                    ? decks.where((d) => d.id != widget.deck!.id).toList()
                                    : decks;
                                
                                if (availableDecks.isEmpty) {
                                  return const Text('No parent decks available');
                                }
                                
                                return DropdownButtonFormField<String?>(
                                  decoration: const InputDecoration(
                                    labelText: 'Parent Deck (optional)',
                                    border: OutlineInputBorder(),
                                  ),
                                  value: _selectedParentDeckId,
                                  hint: const Text('Select a parent deck (optional)'),
                                  items: [
                                    const DropdownMenuItem<String?>(
                                      value: null,
                                      child: Text('None'),
                                    ),
                                    ...availableDecks.map((deck) => DropdownMenuItem<String?>(
                                      value: deck.id,
                                      child: Text(deck.title),
                                    )),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedParentDeckId = value;
                                    });
                                  },
                                );
                              },
                              loading: () => const Center(child: CircularProgressIndicator()),
                              error: (error, stackTrace) => Text('Error loading decks: $error'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Description section
                    Card(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Additional Information',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16.0),
                            
                            // Description field
                            TextFormField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                labelText: 'Description (optional)',
                                hintText: 'Enter deck description',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 3,
                            ),
                            const SizedBox(height: 16.0),
                            
                            // Tags field (to be implemented)
                            const TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                labelText: 'Tags',
                                hintText: 'To be implemented',
                                border: OutlineInputBorder(),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: widget.onCancel,
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: widget.isLoading ? null : _submitForm,
                child: Text(widget.submitButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showIconSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Icon'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: _availableIcons.length,
            itemBuilder: (context, index) {
              final icon = _availableIcons[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedIcon = icon;
                  });
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  backgroundColor: _selectedIcon == icon
                      ? _selectedColor
                      : Colors.grey.shade200,
                  child: Icon(
                    icon,
                    color: _selectedIcon == icon ? Colors.white : Colors.black,
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
  
  void _showColorSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Color'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: _availableColors.length,
            itemBuilder: (context, index) {
              final color = _availableColors[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    _selectedColor = color;
                  });
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  backgroundColor: color,
                  child: _selectedColor == color
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
} 