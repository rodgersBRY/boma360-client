import 'package:client/config/env.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/app_theme.dart';
import 'package:client/helper/toast.dart';
import 'package:client/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }

  try {
    await Supabase.initialize(url: kSupabaseUri, anonKey: kSupabaseAnonKey);
  } catch (e) {
    if (kDebugMode) {
      print('supabase initialize error: $e');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      initialRoute: AppRoutes.kLogin,
      getPages: appPages,
      theme: AppTheme.light,
    );
  }
}
