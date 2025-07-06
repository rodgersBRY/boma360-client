import 'package:client/bindings/auth_bindings.dart';
import 'package:client/bindings/dashboard_bindings.dart';
import 'package:client/config/routes.dart';
import 'package:client/presentation/pages/main/notifications/notification/notification.dart';
import 'package:client/presentation/pages/pages.dart';
import 'package:client/presentation/pages/splash/splash.dart';
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
  ),GetPage(
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
  GetPage(name: AppRoutes.kCattleProfile, page: () => CowProfileWidget()),
];
