import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/helper/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  static final supabase = Supabase.instance.client;

  static Future login(Map<String, String> userData) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: userData['email'],
        password: userData['password']!,
      );

      final user = response.user;

      if (user != null) {
        ToastUtils.showSuccess(
          title: 'Authentication Success',
          subtitle: 'You have successfully logged in',
        );

        if (response.session != null) {
          final session = response.session;
          SessionManager.saveSession(session!);
        }

        return user;
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future signup(Map<String, dynamic> userData) async {
    AuthResponse? response;
    User? user;

    try {
      response = await supabase.auth.signUp(
        email: userData['email'],
        password: userData['password']!,
        data: userData,
      );

      user = response.user;
    } catch (err) {
      handleError('Sign Up', err);
    }

    try {
      if (user != null) {
        await supabase.from('profiles').insert({
          'id': user.id,
          'email': user.email,
          'name': userData['displayName'],
          'phone': userData['phone'],
          'role': userData['role'],
          'farmname': userData['farmName'],
          'subscription': 'free',
        });

        ToastUtils.showSuccess(
          title: 'Authentication Success',
          subtitle: 'You have successfully registered',
        );

        return user;
      }
    } catch (err) {
      handleError('Sign Up', err);
    }
  }
}
