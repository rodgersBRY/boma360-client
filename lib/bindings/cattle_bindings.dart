import 'package:client/presentation/pages/main/cows/addCow/add_cow_controller.dart';
import 'package:client/presentation/pages/main/cows/cow/cow_profile_controller.dart';
import 'package:get/get.dart';

class CattleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowProfileController>(() => CowProfileController());
    Get.lazyPut<AddCowController>(() => AddCowController());
  }
}
