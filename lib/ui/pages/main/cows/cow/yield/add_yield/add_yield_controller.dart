import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/yield.dart';
import 'package:client/services/yield_record.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddYieldController extends GetxController {
  late final String cattleId;

  var isLoading = false.obs;
  var isFailed = false.obs;

  var yieldType = YieldType.milk.obs;
  var milkingSession = MilkingSession.morning.obs;
  var lactationStage = LactationStage.early.obs;
  var quantity = ''.obs;

  var milkQualityScore = '';
  var slaughterWeight = '';
  var carcassWeight = '';
  var meatGrade = '';
  var date = Rx<DateTime?>(null);
  var notes = '';

  @override
  void onInit() async {
    super.onInit();

    cattleId = Get.parameters['cattleId']!;
  }

  saveInfo() async {
    if (isLoading.isTrue) return;

    if (quantity.value == '' || date.value == null) {
      ToastUtils.showError(
        title: 'Alert',
        subtitle: 'Quantity and date fields are required',
      );

      return;
    }

    if (yieldType.value == YieldType.meat &&
        (slaughterWeight == '' || carcassWeight == '' || meatGrade == '')) {
      ToastUtils.showError(
        title: 'Alert',
        subtitle: 'Fill all details for current ${yieldType.value} yield',
      );

      return;
    }

    isFailed.value = false;
    isLoading.value = true;

    try {
      User? farmer = await SessionManager.getUser();

      if (farmer != null) {
        final yieldData = YieldModel(
          farmerId: farmer.id,
          cattleId: cattleId,
          yieldType: yieldType.value,
          milkingSession: milkingSession.value,
          lactationStage: lactationStage.value,
          quantity: double.tryParse(quantity.value) ?? 0.0,
          milkQualityScore: double.tryParse(milkQualityScore),
          slaughterWeight: double.tryParse(slaughterWeight),
          carcassWeight: double.tryParse(carcassWeight),
          meatGrade: double.tryParse(meatGrade),
          dateCollected: date.value!,
          notes: notes,
        );

        if (kDebugMode) print(yieldData.yieldType);

        var yieldRecord = await YieldRecordService.newYieldRecord(yieldData);

        Get.back(result: yieldRecord);
      }
    } on PostgrestException catch (err) {
      isFailed.value = true;

      handleError(err);
    } catch (err) {
      isFailed.value = true;

      handleGenericError(err);
    } finally {
      isLoading.value = false;
    }
  }
}
