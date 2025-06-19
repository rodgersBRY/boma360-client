import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/pages/main/main_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomTileModel {
  final IconData icon;
  final Color? color;
  final String title;
  final String subtitle;
  final VoidCallback? func;

  const CustomTileModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.color,
    this.func,
  });
}

final List<CustomTileModel> kOverViewData = [
  CustomTileModel(
    title: '53',
    subtitle: 'Total Cattle',
    icon: FontAwesomeIcons.cow,
  ),
  CustomTileModel(title: '4', subtitle: 'Breeds', icon: FontAwesomeIcons.list),
  CustomTileModel(
    title: '154L',
    subtitle: 'Daily Milk Yields',
    icon: FontAwesomeIcons.bottleWater,
  ),
  CustomTileModel(
    title: '3',
    subtitle: 'Recent Activity',
    icon: FontAwesomeIcons.clock,
  ),
];

final List<CustomTileModel> kQuickActionData = [
  CustomTileModel(
    title: 'Add Animal',
    subtitle: 'Register New Cattle',
    icon: FontAwesomeIcons.plus,
    color: AppColors.primary,
    func: () => Get.toNamed(AppRoutes.kNewCattle),
  ),
  CustomTileModel(
    title: 'Animal List',
    subtitle: 'View all cattle',
    icon: FontAwesomeIcons.cow,
    color: AppColors.danger,
    func: () {
      Get.find<MainController>().changeIndex(1);
    },
  ),
  CustomTileModel(
    title: 'Yield Records',
    subtitle: 'Track milk production',
    icon: FontAwesomeIcons.bottleWater,
    color: AppColors.secondary,
  ),
  CustomTileModel(
    title: 'Reports',
    subtitle: 'Analytics & Insights',
    icon: FontAwesomeIcons.chartArea,
    color: AppColors.primary,
    func: () {
      Get.find<MainController>().changeIndex(2);
    },
  ),
];
