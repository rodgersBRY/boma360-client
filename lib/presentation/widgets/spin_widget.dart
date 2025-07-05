import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinWidget extends StatelessWidget {
  final Color? backgroundColor;

  const SpinWidget({super.key, this.backgroundColor = AppColors.white});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(color: AppColors.white, size: 20);
  }
}
