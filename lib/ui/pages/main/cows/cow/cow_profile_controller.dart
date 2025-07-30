import 'package:client/core/errors/error_handler.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/cattle.dart';
import 'package:client/services/yield_record.dart';
import 'package:get/get.dart';

class CowProfileController extends GetxController {
  late final String cattleId;

  var isLoading = false.obs;
  var isFailed = false.obs;

  Rx<CattleModel?> cattle = Rx(null);

  var totalYield = 0;

  @override
  void onInit() async {
    super.onInit();

    cattleId = Get.parameters['cattleId']!;

    await fetch(refresh: false);
  }

  fetch({bool? refresh}) async {
    if (isLoading.isTrue) return;

    isFailed.value = false;
    isLoading.value = true;

    try {
      var cattleFuture = CattleService.getCattleWIthId(cattleId);
      var yieldFuture = YieldRecordService.fetchAggregateCattleYieldRecords(
        cattleId,
      );

      final [cattleData, yieldAggregate] = await Future.wait([
        cattleFuture,
        yieldFuture,
      ]);

      if (cattleData != null && yieldAggregate != null) {
        cattle.value = cattleData as CattleModel?;

        totalYield = yieldAggregate;
      }
    } catch (err) {
      handleGenericError(err);

      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
