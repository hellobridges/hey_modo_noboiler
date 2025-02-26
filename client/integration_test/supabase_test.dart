import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:client/main.dart' as app;
import 'package:client/src/services/supabase_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Verify Supabase initialization on Android', (WidgetTester tester) async {
    // Call the main function to initialize Supabase and run the app
    app.main();
    
    // Wait for app to settle
    await tester.pumpAndSettle();
    
    // Verify that Supabase client is initialized
    expect(SupabaseService().client, isNotNull);
    
    // Verify that the app is running (MaterialApp is rendered)
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Print success message
    debugPrint('✅ Supabase initialized successfully on Android!');
  });
} 