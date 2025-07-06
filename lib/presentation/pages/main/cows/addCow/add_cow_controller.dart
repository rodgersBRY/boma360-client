import 'package:client/data/cattle_data.dart';
import 'package:client/model/cattle.dart';
import 'package:get/get.dart';

class AddCowController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  Rx<String?> selectedType = Rx(null);

  RxList<String?> filteredBreeds = RxList.empty(growable: true);

  var selectedBreed = ''.obs;
  var selectedGender = 'Female';

  @override
  onInit() {
    // listens to changes to selectedType and executes
    ever(selectedType, (_) => upateFilteredBreeds());

    super.onInit();
  }

  List<BreedType> get breedTypes =>
      cowBreeds.map((b) => b.type).toSet().toList();

  upateFilteredBreeds() {
    if (selectedType.value == null) {
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

  void save() {}
}
