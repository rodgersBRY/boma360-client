import 'package:client/ui/pages/main/cows/addCow/add_cow_controller.dart';
import 'package:client/ui/pages/main/cows/cow/cow_profile_controller.dart';
import 'package:client/ui/pages/main/cows/cow/yield/add_yield/add_yield_controller.dart';
import 'package:client/ui/pages/main/cows/cow/yield/yield_controller.dart';
import 'package:get/get.dart';

class CattleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowProfileController>(() => CowProfileController());
    Get.lazyPut<AddYieldController>(() => AddYieldController());
    Get.lazyPut<YieldController>(() => YieldController());
  }
}

class NewCattleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCowController>(() => AddCowController());
  }
}
