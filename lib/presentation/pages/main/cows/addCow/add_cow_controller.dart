import 'package:client/core/errors/error_handler.dart';
import 'package:client/core/errors/session_manager.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/helper/toast.dart';
import 'package:client/model/cattle.dart';
import 'package:client/services/cattle.dart';
import 'package:client/services/farm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCowController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  RxList<String?> filteredBreeds = RxList.empty(growable: true);

  var selectedType = ''.obs;
  var selectedBreed = ''.obs;
  var selectedGender = 'Female';

  var tagIdTextController = TextEditingController();
  var nameTextController = TextEditingController();
  var weightTextController = TextEditingController();
  var ageTextController = TextEditingController();

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

  save() async {
    if (isLoading.isTrue) return;

    if (isEmpty()) {
      ToastUtils.showWarning(
        title: "Check again",
        subtitle: 'All fields marked * are required',
      );

      return;
    }

    isFailed.value = false;
    isLoading.value = true;

    var tagId = tagIdTextController.text;
    var name = nameTextController.text;
    var age = ageTextController.text;
    var weight = weightTextController.text;

    final user = await SessionManager.getUser();

    if (user != null) {
      final farm = await FarmService.getFarm(user.id);

      var newCattle = CattleModel(
        userId: user.id,
        farmId: farm!.id!,
        tag: tagId,
        name: name,
        status: Status.healthy,
        breed: selectedBreed.value,
        type: selectedType.value,
        age: age,
        gender: selectedGender,
        weight: weight,
      );

      try {
        await CattleService.newCattle(newCattle);

        clearForm();

        await Future.delayed(const Duration(seconds: 2), () {});

        Get.back();
      } catch (err) {
        handleGenericError(err);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void clearForm() {
    tagIdTextController.clear();
    nameTextController.clear();
    weightTextController.clear();
    ageTextController.clear();
    filteredBreeds.clear();

    selectedType.value = '';
    selectedBreed.value = '';
    selectedGender = 'Female';
  }

  bool isEmpty() {
    var tagId = tagIdTextController.text;
    var age = ageTextController.text;
    var weight = int.parse(weightTextController.text);

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
