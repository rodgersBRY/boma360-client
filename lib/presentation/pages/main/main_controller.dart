import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/data/notifications.dart';
import 'package:client/model/cattle.dart';
import 'package:client/model/notification.dart';
import 'package:client/services/cattle.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  var isLoading = false.obs;
  var isFailed = false.obs;

  RxList<CattleModel?> cattle = RxList.empty(growable: true);
  RxList<AppNotification?> notifications = RxList.empty(growable: true);

  Rx<User?> user = Rx(null);

  @override
  onInit() async {
    super.onInit();

    await fetch(refresh: false);
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  fetch({refresh = false}) async {
    if (isLoading.isTrue) return;

    isFailed.value = false;
    isLoading.value = true;

    user.value = await SessionManager.getUser();

    try {
      var cows = await CattleService.fetchCattle();
      cattle.assignAll(cows);

      notifications.assignAll(kNotifications);
    } catch (err) {
      isFailed.value = true;
      handleError('Error Fetching data', err);
    } finally {
      isLoading.value = false;
    }
  }
}
