import 'package:flutter/material.dart';

/// The Social tab of the application.
class SocialTab extends StatelessWidget {
  const SocialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
      ),
      body: const Center(
        child: Text(
          'Social Tab Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 