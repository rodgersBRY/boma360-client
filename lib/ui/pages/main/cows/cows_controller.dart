import 'package:client/core/errors/error_handler.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/cattle.dart';
import 'package:get/get.dart';

class CowsController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  RxList<CattleModel?> cattle = RxList.empty(growable: true);

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
      var cows = await CattleService.fetchCattle();
      cattle.assignAll(cows);
    } catch (err) {
      isFailed.value = true;
      
      handleGenericError(err);
    } finally {
      isLoading.value = false;
    }
  }
}
