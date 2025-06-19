import 'package:client/presentation/pages/main/cows/cows.dart';
import 'package:client/presentation/pages/main/dashboard/dashboard.dart';
import 'package:client/presentation/pages/main/main_controller.dart';
import 'package:client/presentation/pages/main/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key});

  final List<Widget> _pages = [
    DashboardWidget(),
    CowsWidget(),
    Center(child: Text('Reports')),
    UserProfileWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<MainController>(MainController());

    return Obx(() {
      return Scaffold(
        body: _pages[controller.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.cow),
              label: 'Cattle',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartColumn),
              label: 'Analytics',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.circleUser),
              label: 'Profile',
            ),
            // ...kNavItems.map((item) {
            //   return BottomNavigationBarItem(
            //     icon: Icon(item.icon),
            //     label: item.label,
            //   );
            // }),
          ],
        ),
      );
    });
  }
}
