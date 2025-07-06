import 'package:client/config/routes.dart';
import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/model/farm.dart';
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

    fetch();
  }

  void fetch() async {
    user.value = await UserService.getUserInfo();

    // var response = await FarmService.getFarm();
    // print(response.toString());

    // farm.value = response;
  }

  void logout() async {
    if (isLoading.isTrue) return;

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 2), () async {
        await SessionManager.logout();

        Get.offAllNamed(AppRoutes.kSplash);
      });
    } catch (err) {
      handleError('Internal Error', err);
    } finally {
      isLoading.value = false;
    }
  }
}
