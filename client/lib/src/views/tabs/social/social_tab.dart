import 'package:flutter/material.dart';
import '../../../widgets/user_settings_menu.dart';

/// The Social tab of the application.
class SocialTab extends StatelessWidget {
  const SocialTab({super.key});

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
          'Social Tab Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
} 