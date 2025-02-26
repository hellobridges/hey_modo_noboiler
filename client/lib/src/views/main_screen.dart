import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tabs/learn/learn_tab.dart';
import 'tabs/build/build_tab.dart';
import 'tabs/explore/explore_tab.dart';
import 'tabs/social/social_tab.dart';
import 'tabs/journeys/journeys_tab.dart';
import '../widgets/user_settings_menu.dart';
import '../providers/auth_provider.dart';

/// The main screen of the application with bottom navigation.
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  // Set initial index to 2 (Learn tab)
  int _currentIndex = 2;

  final List<Widget> _tabs = const [
    JourneysTab(),
    BuildTab(),
    LearnTab(),
    ExploreTab(),
    SocialTab(),
  ];

  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes
    ref.watch(authStateListenerProvider);
    
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: Container(
        height: 75, // Slightly increased height for larger icons and text
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12), // Add bottom padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Changed to spaceEvenly for tighter spacing
            children: [
              _buildNavItem(0, Icons.map, 'Journeys'),
              _buildNavItem(1, Icons.build, 'Build'),
              _buildNavItem(2, Icons.school, 'Learn'),
              _buildNavItem(3, Icons.explore, 'Explore'),
              _buildNavItem(4, Icons.people, 'Social'),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    // Brighter blue for active items
    final activeColor = const Color(0xFF2196F3); // Bright Material blue
    final inactiveColor = Theme.of(context).colorScheme.onSurface.withOpacity(0.7);
    
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8), // Reduced horizontal padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 26, // Increased icon size
              color: isSelected ? activeColor : inactiveColor,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12, // Increased text size
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 