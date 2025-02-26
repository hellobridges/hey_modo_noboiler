import 'package:flutter/material.dart';
import 'views/main_screen.dart';
import 'views/auth/login.dart';
import 'views/auth/auth_service.dart';

/// The root widget of the application.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: AuthService().isAuthenticated ? const MainScreen() : const LoginScreen(),
    );
  }
} 