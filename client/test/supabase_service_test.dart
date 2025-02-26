import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:client/src/services/supabase_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  setUpAll(() async {
    // Load the .env file for testing
    await dotenv.load(fileName: '.env');
  });
  
  test('SupabaseService initializes correctly', () async {
    // Verify that the .env file contains the required variables
    expect(dotenv.env['SUPABASE_URL'], isNotNull);
    expect(dotenv.env['SUPABASE_ANON_KEY'], isNotNull);
    
    // Note: We're not actually initializing Supabase here to avoid
    // creating real connections during tests, but we're verifying
    // that the environment variables are available
  });
  
  test('SupabaseService is a singleton', () {
    // Verify that multiple instances of SupabaseService are the same object
    final service1 = SupabaseService();
    final service2 = SupabaseService();
    
    expect(identical(service1, service2), isTrue);
  });
} 