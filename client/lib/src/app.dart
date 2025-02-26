import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/main_screen.dart';
import 'views/auth/login.dart';
import 'providers/auth_provider.dart';

/// The root widget of the application.
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authStateProvider);
    
    return MaterialApp(
      title: 'Hey Modo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: isAuthenticated ? const MainScreen() : const LoginScreen(),
    );
  }
} 