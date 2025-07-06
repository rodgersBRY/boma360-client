import 'package:client/config/routes.dart';
import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  void logout() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2), () async {
        await SessionManager.logout();

        Get.offAllNamed(AppRoutes.kSplash);
      });
    } catch (err) {
      handleError('Internal Error', err);
    } finally {
      isLoading.value = false;
    }
  }
}
