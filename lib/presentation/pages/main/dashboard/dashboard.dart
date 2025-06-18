import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/dashboard/dashboard_alerts.dart';
import 'package:client/data/dashboard/dashboard_tiles.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/custom_tile.dart';
import 'package:client/presentation/widgets/dashboard/alert_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: ListTile(
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(kOwnerImage),
          ),
          title: Text(
            'Good Morning, Mawi',
            style: textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            'Monday, June 16',
            style: textTheme.headlineSmall?.copyWith(
              color: const Color.fromARGB(255, 213, 213, 213),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.kNotifications),
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 60,
            width: screenWidth,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
          ),
          const SizedBox(height: 28.0),
          Container(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kDefaultPadding,
            ),
            width: screenWidth,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Farm Overview',
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 330,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(), // preve
                      children: [
                        ...kOverViewData.map((item) {
                          return CustomTile(
                            color: AppColors.background,
                            textTheme: textTheme,
                            leadWidget: Icon(
                              item.icon,
                              size: 25,
                              color: AppColors.secondary,
                            ),
                            title: item.title,
                            subtitle: item.subtitle,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Quick Actions',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 420,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // preve
                children: [
                  ...kQuickActionData.map((item) {
                    return CustomTile(
                      color: AppColors.white,
                      textTheme: textTheme,
                      leadWidget: CircleAvatar(
                        radius: 35,
                        backgroundColor: item.color,
                        child: Icon(item.icon, size: 25, color: Colors.white),
                      ),
                      title: item.title,
                      subtitle: item.subtitle,
                      shadow: true,
                      func: item.func,
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Recent Alerts',
                      style: textTheme.headlineLarge,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.red.withValues(alpha: .1),
                      child: Icon(
                        FontAwesomeIcons.solidBell,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...kNotifications.sublist(0, 2).map((alert) {
                    return AlertListTile(
                      textTheme: textTheme,
                      color: alert.priority.color,
                      icon: alert.icon,
                      title: alert.title,
                      subtitle: alert.content,
                    );
                  }),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    textTheme: textTheme,
                    label: 'View All Alerts',
                    func: () => Get.toNamed(AppRoutes.kNotifications),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
