import 'package:flutter_dotenv/flutter_dotenv.dart';

final kAppName = dotenv.env['APP_NAME']!;

final kSupabaseUri = dotenv.env['SUPABASE_URI']!;

final kSupabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
