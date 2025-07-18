import 'package:get/get.dart';

class AddYieldController extends GetxController {
  late final String cattleId;

  @override
  void onInit() async {
    super.onInit();

    cattleId = Get.parameters['cattleId']!;
  }
}
