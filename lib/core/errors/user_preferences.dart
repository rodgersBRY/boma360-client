import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserPreferences {
  static const _keyUid = 'user_id';
  static const _keyName = 'display_name';
  static const _keyEmail = 'user_email';
  static const _keyRole = 'user_role';

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_keyUid, user.id);
    await prefs.setString(_keyName, user.id);
    await prefs.setString(_keyUid, user.id);
    await prefs.setString(_keyUid, user.id);
  }
}
