import 'package:flutter/material.dart';

/// The Learn tab of the application.
class LearnTab extends StatelessWidget {
  const LearnTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
      ),
      body: const Center(
        child: Text(
          'Learn Tab Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 