import 'package:client/config/routes.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void logout() async {
    await SessionManager.logout();

    Get.offAllNamed(AppRoutes.kLogin);
  }
}
