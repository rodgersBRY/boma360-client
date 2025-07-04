import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  static final supabase = Supabase.instance.client;

  static Future login(Map<String, String> userData) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: userData['email'],
        password: userData['password']!,
      );

      if (response.user != null) return response.user;
    } catch (err) {
      if (kDebugMode) print(err);
    }
  }

  static Future signup(Map<String, dynamic> userData) async {
    try {
      final response = await supabase.auth.signUp(
        email: userData['email'],
        password: userData['password']!,
        data: userData,
      );

      if (response.user != null) {
        print('user registration successful: ${response.user?.email}');

        return response.user;
      }
    } catch (err) {
      if (kDebugMode) print(err);
    }
  }
}
