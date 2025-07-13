import 'package:client/core/errors/error_handler.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/cattle.dart';
import 'package:get/get.dart';

class CowProfileController extends GetxController {
  late final String cattleId;

  var isLoading = false.obs;
  var isFailed = false.obs;

  Rx<CattleModel?> cattle = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    
    cattleId = Get.parameters['cattleId']!;

    await fetch();
  }

  fetch() async {
    if (isLoading.isTrue) return;

    isFailed.value = false;
    isLoading.value = true;

    try {
      var cattleData = await CattleService.getCattleWIthId(cattleId);

      if (cattleData != null) {
        cattle.value = cattleData;
      }
    } catch (err) {
      handleError('Server Error', err);
      
      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
