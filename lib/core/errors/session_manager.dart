import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SessionManager {
  static const _refreshTokenKey = 'supabase_refresh_token';

  /// Save Supabase session to SharedPreferences
  static Future<void> saveSession(Session session) async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = session.refreshToken;

    if (refreshToken != null) {
      await prefs.setString(_refreshTokenKey, refreshToken);
    }
  }

  // restore session to supabase
  static Future<bool> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString(_refreshTokenKey);

    if (refreshToken != null) {
      try {
        await Supabase.instance.client.auth.recoverSession(refreshToken);
        return true;
      } catch (e) {
        if (kDebugMode) {
          print('Error restoring session: $e');
        }
        return false;
      }
    }

    return false;
  }

  /// Clear session from Supabase and SharedPreferences
  static Future<void> logout() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_refreshTokenKey);
  }
}
