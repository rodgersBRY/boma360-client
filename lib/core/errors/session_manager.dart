import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SessionManager {
  static const _sessionKey = 'supabase_session';

  /// Save Supabase session to SharedPreferences
  static Future<void> saveSession(Session session) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_sessionKey, jsonEncode(session.toJson()));
  }

  // restore session to supabase
  static Future<bool> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final sessionJson = prefs.getString(_sessionKey);

    try {
      if (sessionJson != null) {
        // final session = Session.fromJson(jsonDecode(sessionJson));
        await Supabase.instance.client.auth.recoverSession(sessionJson);
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error restoring session: $e');
      }
      return false;
    }

    return false;
  }

  /// Clear session from Supabase and SharedPreferences
  static Future<void> logout() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signOut(scope: SignOutScope.global);

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);

    await Future.delayed(const Duration(milliseconds: 200));
  }

  static Future<User?> getUser() async =>
      Supabase.instance.client.auth.currentUser;
}
