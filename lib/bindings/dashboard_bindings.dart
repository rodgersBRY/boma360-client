import 'package:client/presentation/pages/main/dashboard/dashboard_controller.dart';
import 'package:client/presentation/pages/main/profile/profile_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
