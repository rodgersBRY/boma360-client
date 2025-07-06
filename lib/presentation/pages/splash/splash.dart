import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/pages/splash/splash_controller.dart';
import 'package:client/presentation/widgets/spin_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('loading...'),
          SpinWidget(backgroundColor: AppColors.primary),
        ],
      ),
    );
  }
}
