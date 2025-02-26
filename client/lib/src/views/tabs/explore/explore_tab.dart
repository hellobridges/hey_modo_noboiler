import 'package:flutter/material.dart';

/// The Explore tab of the application.
class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: const Center(
        child: Text(
          'Explore Tab Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 