import 'package:flutter/material.dart';
import '../../../widgets/user_settings_menu.dart';
import 'leaderboard_widget.dart';

/// The Social tab of the application.
class SocialTab extends StatelessWidget {
  const SocialTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          UserSettingsMenu(),
        ],
      ),
      body: const LeaderboardWidget(),
    );
  }
} 