import 'package:client/config/routes.dart';
import 'package:client/core/errors/error_handler.dart';
import 'package:client/helper/toast.dart';
import 'package:client/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;
  var obscureText = true.obs;

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController roleTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  Rx<bool> acceptedTermsOfService = false.obs;

  void toggleVisibility() => obscureText.value = !obscureText.value;

  Future login() async {
    isFailed.value = false;

    if (isLoading.isTrue) return;

    var email = emailTextController.value.text;
    var password = passwordTextController.value.text;

    if (email == '' || password == '') {
      ToastUtils.showError(
        title: 'Authentication Error',
        subtitle: 'Email and Password is required',
      );

      return;
    }

    isLoading.value = true;

    var userData = {'email': email, 'password': password};

    try {
      await AuthenticationService.login(userData);

      Get.offNamed(AppRoutes.kSplash);
    } on AuthApiException catch (err) {
      handleError('Authentication Error', err);

      isFailed.value = true;
    } catch (err) {
      handleError('Server Error', err);

      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  Future register() async {
    isFailed.value = false;

    if (isLoading.isTrue) return;

    var name = nameTextController.value.text;
    var phone = phoneTextController.value.text;
    var email = emailTextController.value.text;
    var role = roleTextController.value.text;
    var password = passwordTextController.value.text;
    var confirmPass = confirmPasswordTextController.value.text;

    if (email == '' || password == '' || name == '' || phone == '') {
      ToastUtils.showError(
        title: 'Authentication Error',
        subtitle: 'All fields are required',
      );

      return;
    }

    if (!(acceptedTermsOfService.isTrue)) {
      ToastUtils.showError(
        title: 'Authentication Error',
        subtitle: 'Please accept the Terms of Service',
      );

      return;
    }

    if (password != confirmPass) {
      ToastUtils.showError(
        title: 'Authentication Error',
        subtitle: 'Passwords do not match',
      );

      return;
    }

    isLoading.value = true;

    var userData = {
      'email': email,
      'displayName': name,
      'phone': phone,
      'role': role,
      'password': password,
    };

    try {
      await AuthenticationService.signup(userData);

      // clear all fields
      nameTextController.clear();
      emailTextController.clear();
      phoneTextController.clear();
      roleTextController.clear();
      passwordTextController.clear();
      confirmPasswordTextController.clear();

      Future.delayed(
        const Duration(seconds: 2),
        () => Get.offNamed(AppRoutes.kLogin),
      );
    } on AuthApiException catch (err) {
      handleError('Authentication Error', err);

      isFailed.value = true;
    } catch (err) {
      handleError('Server Error', err);

      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
    roleTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();

    super.dispose();
  }
}
