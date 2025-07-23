import 'package:client/bindings/auth_bindings.dart';
import 'package:client/bindings/cattle_bindings.dart';
import 'package:client/bindings/dashboard_bindings.dart';
import 'package:client/config/routes.dart';
import 'package:client/ui/pages/main/cows/cow/yield/add_yield/add_yield.dart';
import 'package:client/ui/pages/pages.dart';
import 'package:get/route_manager.dart';

final List<GetPage> appPages = [
  GetPage(
    name: AppRoutes.kLogin,
    page: () => LoginWidget(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.kRegister,
    page: () => RegisterWidget(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.kSplash,
    page: () => SplashWidget(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.kMain,
    page: () => MainWidget(),
    binding: MainBindings(),
  ),
  GetPage(
    name: AppRoutes.kUpdateFarm,
    page: () => UpdateFarmWidget(),
    binding: MainBindings(),
  ),
  GetPage(
    name: AppRoutes.kNotifications,
    page: () => NotificationsWidget(),
    children: [
      GetPage(
        name: AppRoutes.kNotificationDetails,
        page: () => NotificationWidget(),
      ),
    ],
  ),
  GetPage(name: AppRoutes.kNewCattle, page: () => NewCowWidget()),
  GetPage(
    name: '${AppRoutes.kCattleProfile}:cattleId',
    page: () => CowProfileWidget(cattleId: Get.parameters['cattleId']!),
    binding: CattleBindings(),
  ),
  GetPage(
    name: '${AppRoutes.kNewYieldRecord}:cattleId',
    page: () => AddYieldWidget(cattleId: Get.parameters['cattleId']!),
    binding: CattleBindings(),
  ),
];
