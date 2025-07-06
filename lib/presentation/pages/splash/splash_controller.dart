import 'package:client/config/routes.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = false.obs;

  @override
  onInit() async {
    super.onInit();

    await checkAuthAndNavigate();
  }

  Future<void> checkAuthAndNavigate() async {
    await Future.delayed(const Duration(seconds: 1)); // optional delay

    final user = await SessionManager.getUser();

    if (user != null) {
      // User is logged in
      Get.offNamed(AppRoutes.kMain);
    } else {
      // User is not logged in
      Get.offNamed(AppRoutes.kLogin);
    }
  }
}
