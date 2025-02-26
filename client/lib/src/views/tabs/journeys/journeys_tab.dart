import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Journeys tab of the application.
class JourneysTab extends ConsumerWidget {
  const JourneysTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journeys'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Your Journeys',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Example journey cards
          _buildJourneyCard(
            context,
            title: 'Flutter Mastery',
            description: 'Master Flutter development from basics to advanced concepts',
            progress: 0.65,
          ),
          _buildJourneyCard(
            context,
            title: 'Mobile App Design',
            description: 'Learn UI/UX principles for mobile applications',
            progress: 0.3,
          ),
          _buildJourneyCard(
            context,
            title: 'Backend Integration',
            description: 'Connect your Flutter app with backend services',
            progress: 0.1,
          ),
        ],
      ),
    );
  }

  Widget _buildJourneyCard(
    BuildContext context, {
    required String title,
    required String description,
    required double progress,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 8),
            Text('${(progress * 100).toInt()}% Complete'),
          ],
        ),
      ),
    );
  }
} 