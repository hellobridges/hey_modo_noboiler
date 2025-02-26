import 'package:flutter/material.dart';
import '../../../widgets/user_settings_menu.dart';

/// The Explore tab of the application.
class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          UserSettingsMenu(),
        ],
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