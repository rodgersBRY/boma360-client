import 'package:client/core/errors/error_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddYieldController extends GetxController {
  late final String cattleId;

  var isLoading = false.obs;
  var isFailed = false.obs;

  var yieldType = 'milk'.obs;
  var milkingSession = 'evening'.obs;
  var lactationStage = 'peak'.obs;
  var quantity = ''.obs;
  
  var milkQualityScore = '';
  var slaughterWeight = '';
  var carcassWeight = '';
  var meatGrade = '';
  var date = '';
  var notes = '';

  @override
  void onInit() async {
    super.onInit();

    cattleId = Get.parameters['cattleId']!;
  }

  saveInfo() async {
    if (isLoading.isTrue) return;

    // if (quantity.value == '' || date == '') {
    //   ToastUtils.showError(
    //     title: 'Alert',
    //     subtitle: 'Quantity and date fields are required',
    //   );
    //
    //   return;
    // }

    isFailed.value = false;
    isLoading.value = true;

    final yieldData = {
      "yieldType": yieldType.value,
      "quantity": quantity.value,
      "date": date,
      "notes": notes,
    };

    if (kDebugMode) print(yieldData);

    try {
      await Future.delayed(const Duration(seconds: 3), () {});

      quantity.value = '';
      date = '';
      notes = '';
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
