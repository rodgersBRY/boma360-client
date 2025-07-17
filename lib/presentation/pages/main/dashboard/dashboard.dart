import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/dashboard/dashboard_tiles.dart';
import 'package:client/helper/util.dart';
import 'package:client/model/notification.dart';
import 'package:client/presentation/pages/main/main_controller.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/custom_tile.dart';
import 'package:client/presentation/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<DashboardController>();
    final mainController = Get.find<MainController>();

    final screenWidth = Get.width;
    final textTheme = Get.textTheme;

    return RefreshIndicator(
      onRefresh: () async => await mainController.fetch(refresh: true),
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: ListView(
          children: [
            Container(
              height: 130,
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      leading: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            kOwnerImage, // or use Image.network(...)
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Obx(() {
                        final user = mainController.user.value;

                        if (user != null) {
                          final displayName =
                              user.userMetadata!['displayName'] as String;
                          final firstName = displayName.split(" ")[1];

                          return ListTile(
                            title: Text(
                              'Good Evening, $firstName',
                              style: textTheme.headlineLarge?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            subtitle: Text(
                              Util.formatDate(
                                DateTime.now(),
                                pattern: 'EEEE, MMMM d',
                              ),
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white.withValues(alpha: .6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      actions: [
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoutes.kNotifications),
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: .2),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                                bottom: Radius.circular(12),
                              ),
                            ),
                            child: Icon(
                              FontAwesomeIcons.bell,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, kDefaultYOffset),
              child: Container(
                padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: Obx(() {
                  final loading = mainController.isLoading.value;
                  final cows = mainController.cattle;
                  final breeds = cows.map((cow) => cow?.breed).toSet().toList();

                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final yesterday = today.subtract(Duration(days: 1));

                  final recentNotifications = mainController.notifications
                      .where((notification) {
                        final date = DateTime(
                          notification!.date.year,
                          notification.date.month,
                          notification.date.day,
                        );

                        return date == today || date == yesterday;
                      });

                  return Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
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
                        if (loading) SpinKitRipple(color: AppColors.danger),
                        if (!loading)
                          SizedBox(
                            height: 330,
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(), // preve
                              children: [
                                CustomTile(
                                  color: AppColors.background,
                                  textTheme: textTheme,
                                  leadWidget: Icon(
                                    FontAwesomeIcons.cow,
                                    size: 25,
                                    color: AppColors.secondary,
                                  ),
                                  title: cows.length.toString(),
                                  subtitle: Text(
                                    "Total Cattle",
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustomTile(
                                  color: AppColors.background,
                                  textTheme: textTheme,
                                  leadWidget: Icon(
                                    FontAwesomeIcons.list,
                                    size: 25,
                                    color: AppColors.secondary,
                                  ),
                                  title: breeds.length.toString(),
                                  subtitle: Text(
                                    "Breeds",
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustomTile(
                                  color: AppColors.background,
                                  textTheme: textTheme,
                                  leadWidget: Icon(
                                    FontAwesomeIcons.bottleWater,
                                    size: 25,
                                    color: AppColors.secondary,
                                  ),
                                  title: '154L',
                                  subtitle: Text(
                                    'Daily Milk Yields',
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CustomTile(
                                  color: AppColors.background,
                                  textTheme: textTheme,
                                  leadWidget: Icon(
                                    FontAwesomeIcons.clock,
                                    size: 25,
                                    color: AppColors.secondary,
                                  ),
                                  title: recentNotifications.length.toString(),
                                  subtitle: Text(
                                    'Recent Alerts',
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  );
                }),
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
                        subtitle: Text(
                          item.subtitle,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                child: Obx(() {
                  final now = DateTime.now();
                  final today = DateTime(now.year, now.month, now.day);
                  final yesterday = today.subtract(Duration(days: 1));

                  final recentNotifications =
                      mainController.notifications.where((notification) {
                        final date = DateTime(
                          notification!.date.year,
                          notification.date.month,
                          notification.date.day,
                        );

                        return date == today || date == yesterday;
                      }).toList();

                  return Column(
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
                      if (mainController.isLoading.isTrue)
                        SpinKitRipple(color: AppColors.danger),
                      if (recentNotifications.isEmpty)
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary.withValues(alpha: .1),
                          ),
                          child: Center(
                            child: Text(
                              'Recent notificationa appear here',
                              style: textTheme.labelSmall?.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      if (mainController.isLoading.isFalse &&
                          recentNotifications.isNotEmpty)
                        ...recentNotifications
                            .sublist(0, recentNotifications.length.clamp(0, 3))
                            .map((alert) {
                              return MyListTile(
                                backgroundColor: alert!.priority.color
                                    .withValues(alpha: .2),
                                leadingWidget: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: alert.priority.color,
                                  child: Icon(
                                    AppNotification.iconFromString(
                                      alert.iconData,
                                    ),
                                  ),
                                ),
                                title: alert.title,
                                subtitle: alert.body,
                              );
                            }),
                      const SizedBox(height: 20),
                      MyElevatedButton(
                        label: Text('View All Alerts'),
                        func: () => Get.toNamed(AppRoutes.kNotifications),
                      ),
                    ],
                  );
                }),
              ),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
