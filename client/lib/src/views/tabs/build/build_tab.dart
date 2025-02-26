import 'package:flutter/material.dart';

/// The Build tab of the application.
class BuildTab extends StatelessWidget {
  const BuildTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build'),
      ),
      body: const Center(
        child: Text(
          'Build Tab Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 