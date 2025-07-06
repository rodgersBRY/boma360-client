import 'package:client/core/errors/error_handler.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/cattle.dart';
import 'package:get/get.dart';

class AddCowController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  RxList<String?> filteredBreeds = RxList.empty(growable: true);

  var selectedType = ''.obs;
  var selectedBreed = ''.obs;
  var selectedGender = 'Female';
  var tagId = '';
  var name = '';
  var weight = 0;
  var age = '';

  List<BreedType> get breedTypes =>
      cowBreeds.map((b) => b.type).toSet().toList();

  @override
  onInit() {
    // listens to changes to selectedType and executes
    ever(selectedType, (_) => upateFilteredBreeds());

    super.onInit();
  }

  upateFilteredBreeds() {
    if (selectedType.value == '') {
      filteredBreeds.clear();
      return;
    }

    filteredBreeds.value =
        cowBreeds
            .where((b) => b.type.name == selectedType.value)
            .map((b) => b.breed)
            .toList();

    // If current selected breed is not in the new list, clear it
    if (!filteredBreeds.contains(selectedBreed.value)) {
      selectedBreed.value = '';
    }
  }

  void save() async {
    if (isLoading.isTrue) return;

    if (isEmpty()) {
      ToastUtils.showWarning(
        title: "Check again",
        subtitle: 'All fields marked * are required',
      );

      return;
    }

    var newCattle = CattleModel(
      tag: tagId,
      status: Status.healthy,
      breed: selectedBreed.value,
      type: selectedType.value as BreedType,
      age: age,
    );

    try {
      CattleService.newCattle(newCattle);
    } catch (err) {
      handleError('Cattle Service Error', err);
    }
  }

  bool isEmpty() {
    if (selectedType.value == '' ||
        selectedBreed.value == '' ||
        selectedGender == '' ||
        tagId == '' ||
        weight == 0 ||
        age == '') {
      return true;
    }

    return false;
  }
}
