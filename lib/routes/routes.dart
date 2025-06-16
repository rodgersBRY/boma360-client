import 'package:client/config/routes.dart';
import 'package:client/presentation/pages/auth/login.dart';
import 'package:client/presentation/pages/auth/register.dart';
import 'package:client/presentation/pages/dashboard/dashboard.dart';
import 'package:get/route_manager.dart';

final List<GetPage> appPages = [
  GetPage(name: AppRoutes.kLogin, page: () => LoginWidget()),
  GetPage(name: AppRoutes.kRegister, page: () => RegisterWidget()),
  GetPage(name: AppRoutes.kDashboard, page: () => DashboardWidget()),
];
