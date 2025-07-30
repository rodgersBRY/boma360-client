import 'package:client/core/errors/error_handler.dart';
import 'package:client/services/yield_record.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalMilkYield = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    await fetch(refresh: false);
  }

  fetch({bool? refresh}) async {
    try {
      var response = await YieldRecordService.fetchAggregateMilkYield();

      totalMilkYield.value = response;
    } catch (err) {
      handleGenericError(err);
    }
  }
}
