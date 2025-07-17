import 'package:client/config/routes.dart';
import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/model/farm.dart';
import 'package:client/services/farm.dart';
import 'package:client/services/user.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var showNoFarmInfo = true.obs;

  Rx<User?> user = Rx(null);
  Rx<FarmModel?> farm = Rx(null);

  @override
  void onInit() async {
    super.onInit();

    await fetch();
  }

  Future<void> fetch() async {
    try {
      var userData = await UserService.getUserInfo();

      if (userData != null) {
        user.value = userData;

        farm.value = await FarmService.getFarm(userData.id);
      }
    } catch (err) {
      handleGenericError(err);
    }
  }

  void logout() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      await SessionManager.logout();

      Get.offAllNamed(AppRoutes.kSplash);
    } catch (err) {
      handleGenericError(err);
    } finally {
      isLoading.value = false;
    }
  }
}
