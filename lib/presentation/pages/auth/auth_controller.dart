import 'package:client/core/errors/error_handler.dart';
import 'package:client/helper/toast.dart';
import 'package:client/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isFailed = false.obs;

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController roleTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController confirmPasswordTextController =
      TextEditingController();

  Rx<bool> acceptedTermsOfService = false.obs;

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
      if (kDebugMode) {
        print('All fields are required');
      }

      return;
    }

    if (password != confirmPass) {
      if (kDebugMode) {
        print('Passwords do not match!');
      }

      return;
    }

    isLoading.value = true;

    var userData = {
      'email': email,
      'displayName': name,
      'phone': phone,
      'password': password,
    };

    try {
      await AuthenticationService.signup(userData);
    } on AuthApiException catch (err) {
      if (kDebugMode) {
        print(err.message);
      }

      isFailed.value = true;
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }

      isFailed.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
