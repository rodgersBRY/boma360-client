import 'package:client/presentation/pages/auth/auth_controller.dart';
import 'package:client/presentation/pages/splash/splash_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
