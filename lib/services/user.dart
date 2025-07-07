import 'package:client/core/errors/session_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  static final supabase = Supabase.instance.client;

  static Future getUserInfo() async {
    final user = await SessionManager.getUser();

    if (user != null) {
      final userJson =
          await supabase.from('profiles').select().eq('id', user.id).single();

      return User.fromJson(userJson);
    }
  }
}
