import 'package:client/presentation/pages/main/cows/cow/cow_profile_controller.dart';
import 'package:get/get.dart';

class CattleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CowProfileController>(() => CowProfileController());
  }
}
