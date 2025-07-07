import 'package:client/presentation/pages/main/cows/addCow/add_cow_controller.dart';
import 'package:client/presentation/pages/main/cows/cows_controller.dart';
import 'package:client/presentation/pages/main/dashboard/dashboard_controller.dart';
import 'package:client/presentation/pages/main/main_controller.dart';
import 'package:client/presentation/pages/main/profile/farm_details/update_farm_controller.dart';
import 'package:client/presentation/pages/main/profile/profile_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<CowsController>(() => CowsController());
    Get.lazyPut<AddCowController>(() => AddCowController());
    Get.lazyPut<UpdateFarmController>(() => UpdateFarmController());
  }
}
