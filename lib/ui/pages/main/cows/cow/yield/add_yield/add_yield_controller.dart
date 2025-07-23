import 'package:get/get.dart';

class AddYieldController extends GetxController {
  late final String cattleId;

  var yieldType = 'milk'.obs;
  var quantity = ''.obs;
  var date = '';
  var notes = '';
  var yieldId = '';

  @override
  void onInit() async {
    super.onInit();

    cattleId = Get.parameters['cattleId']!;
  }

  saveInfo() {
    print(yieldType);
    print(quantity);
  }
}
