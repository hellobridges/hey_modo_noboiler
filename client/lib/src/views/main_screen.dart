import 'package:flutter/material.dart';
import 'tabs/learn/learn_tab.dart';
import 'tabs/build/build_tab.dart';
import 'tabs/explore/explore_tab.dart';
import 'tabs/social/social_tab.dart';

/// The main screen of the application with bottom navigation.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    LearnTab(),
    BuildTab(),
    ExploreTab(),
    SocialTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          NavigationDestination(
            icon: Icon(Icons.build),
            label: 'Build',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Social',
          ),
        ],
      ),
    );
  }
} 