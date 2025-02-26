import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:client/src/services/supabase_service.dart';
import 'package:client/src/app.dart';

void main() {
  testWidgets('Supabase initializes correctly on Android', (WidgetTester tester) async {
    // Load environment variables
    await dotenv.load(fileName: '.env');
    
    // Initialize Supabase
    await SupabaseService().initialize();
    
    // Verify Supabase client is initialized
    expect(SupabaseService().client, isNotNull);
    
    // Pump the app to verify it loads without errors
    await tester.pumpWidget(const App());
    
    // Verify the app renders without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });
} 