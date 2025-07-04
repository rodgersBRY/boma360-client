import 'package:client/config/routes.dart';
import 'package:client/presentation/pages/main/notifications/notification/notification.dart';
import 'package:client/presentation/pages/pages.dart';
import 'package:get/route_manager.dart';

final List<GetPage> appPages = [
  GetPage(name: AppRoutes.kLogin, page: () => LoginWidget()),
  GetPage(name: AppRoutes.kRegister, page: () => RegisterWidget()),
  GetPage(name: AppRoutes.kMain, page: () => MainWidget()),
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
