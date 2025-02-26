import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'tabs/learn/learn_tab.dart';
import 'tabs/build/build_tab.dart';
import 'tabs/explore/explore_tab.dart';
import 'tabs/social/social_tab.dart';
import 'auth/login.dart';
import '../providers/auth_provider.dart';

/// The main screen of the application with bottom navigation.
class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    LearnTab(),
    BuildTab(),
    ExploreTab(),
    SocialTab(),
  ];

  Future<void> _signOut() async {
    try {
      final authService = ref.read(authServiceProvider);
      await authService.signOut();
      
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to auth state changes
    ref.watch(authStateListenerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hey Modo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
            tooltip: 'Logout',
          ),
        ],
      ),
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