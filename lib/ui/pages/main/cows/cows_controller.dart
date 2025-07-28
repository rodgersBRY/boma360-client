import 'package:client/core/errors/error_handler.dart';
import 'package:client/model/cattle.dart';
import 'package:client/ui/pages/main/main_controller.dart';
import 'package:get/get.dart';

class CowsController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  RxList<CattleModel?> cattle = RxList.empty(growable: true);

  MainController mainController = Get.find<MainController>();

  @override
  onInit() async {
    super.onInit();

    await fetch();
  }

  Future<void> fetch({bool? refresh = false}) async {
    if (isLoading.isTrue) return;

    isFailed.value = false;
    isLoading.value = true;

    try {
      var cows = mainController.cattle;
      
      cattle.assignAll(cows);
    } catch (err) {
      isFailed.value = true;

      handleGenericError(err);
    } finally {
      isLoading.value = false;
    }
  }
}
