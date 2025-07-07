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

  Rx<User?> user = Rx(null);
  Rx<FarmModel?> farm = Rx(null);

  @override
  void onInit() async {
    super.onInit();

    await fetch();
  }

  Future<void> fetch() async {
    try {
      user.value = await UserService.getUserInfo();

      farm.value = await FarmService.getFarm();
    } catch (err) {
      handleError('server error', err);
    }
  }

  void logout() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      await SessionManager.logout();

      Get.offAllNamed(AppRoutes.kSplash);
    } catch (err) {
      handleError('Internal Error', err);
    } finally {
      isLoading.value = false;
    }
  }
}
