import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/deck.dart';
import '../../../providers/flashcard_providers.dart';
import '../../../services/flashcard_service.dart';

/// Screen for creating a new deck
class CreateDeckScreen extends ConsumerStatefulWidget {
  const CreateDeckScreen({super.key});

  @override
  ConsumerState<CreateDeckScreen> createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends ConsumerState<CreateDeckScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  // Default icon and color
  IconData _selectedIcon = Icons.folder;
  Color _selectedColor = Colors.blue;
  
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
  
  bool _isLoading = false;
  String? _errorMessage;
  
  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _createDeck() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final flashcardService = ref.read(flashcardServiceProvider);
      
      // Create metadata with icon and color information
      final metadata = {
        'icon': _selectedIcon.codePoint,
        'icon_font_family': 'MaterialIcons',
        'color': _selectedColor.value,
      };
      
      await flashcardService.createDeck(
        title: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        metadata: metadata,
      );
      
      // Refresh the decks list
      ref.refresh(rootDecksProvider);
      
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Deck'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Error message
                    if (_errorMessage != null)
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
                                  text: _errorMessage,
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _isLoading ? null : _createDeck,
                child: const Text('Create'),
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