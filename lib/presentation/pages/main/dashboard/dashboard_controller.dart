import 'package:client/core/errors/session_manager.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardController extends GetxController {
  User? user;

  @override
  onInit() async {
    super.onInit();

    await fetch();
  }

  fetch() async {
    user = await SessionManager.getUser();
  }
}
