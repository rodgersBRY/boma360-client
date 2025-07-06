import 'package:client/core/errors/session_manager.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  Rx<User?> user = Rx(null);

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  onInit() async {
    super.onInit();

    await fetch();
  }

  fetch() async {
    user.value = await SessionManager.getUser();
  }
}
