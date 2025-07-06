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
    final user = await SessionManager.getUser();

    // wait for 2 seconds before navigating
    // await Future.delayed(const Duration(seconds: 2), () {
    //   if (user != null) {
    //     Get.offNamed(AppRoutes.kMain);
    //   } else {
    //     Get.offNamed(AppRoutes.kLogin);
    //   }
    // });
  }
}
