import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/farm.dart';
import 'package:client/services/farm.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UpdateFarmController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  final farmNameTextController = TextEditingController();
  final farmLocationTextController = TextEditingController();

  saveInfo() async {
    isFailed.value = false;

    if (isLoading.isTrue) return;

    var farmName = farmNameTextController.value.text;
    var farmLocation = farmLocationTextController.value.text;

    User? user = await SessionManager.getUser();

    if (isEmpty()) {
      ToastUtils.showError(
        position: DelightSnackbarPosition.bottom,
        title: 'Input Error',
        subtitle: 'Enter a name and location for your farm',
      );

      return;
    }

    isLoading.value = true;

    if (user != null) {
      var farmData = FarmModel(userId: user.id, name: farmName)
        ..location = farmLocation;

      try {
        var response = await FarmService.newFarm(farmData);

        Get.back(result: response);
      } catch (err) {
        handleGenericError(err);

        isFailed.value = true;
      } finally {
        isLoading.value = false;
      }
    }
  }

  bool isEmpty() {
    if (farmNameTextController.text.isEmpty ||
        farmLocationTextController.text.isEmpty) {
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    super.dispose();

    farmLocationTextController.dispose();
    farmNameTextController.dispose();
  }
}
