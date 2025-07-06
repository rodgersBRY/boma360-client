import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/helper/util.dart';
import 'package:client/model/notification.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NotificationCard extends StatelessWidget {
  final double screenWidth;
  final TextTheme textTheme;
  final AppNotification notification;

  const NotificationCard({
    super.key,
    required this.screenWidth,
    required this.textTheme,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        width: screenWidth,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: BoxBorder.fromLTRB(
            left: BorderSide(color: notification.priority.color, width: 6),
          ),
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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: notification.priority.color.withValues(
                    alpha: .2,
                  ),
                  child: Icon(
                    AppNotification.iconFromString(notification.iconData),
                    color: notification.priority.color,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: notification.priority.color,
                              borderRadius: BorderRadius.circular(
                                kDefaultRadius,
                              ),
                            ),
                            child: Text(
                              notification.priority.name,
                              style: textTheme.labelSmall?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        notification.body,
                        style: textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              spacing: 10,
              children: [
                Text(
                  Util.formatDate(notification.date),
                  style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
                Expanded(
                  child: MyElevatedButton(
                    height: 55.0,
                    label: Text('View'),
                    func:
                        () => Get.toNamed(
                          '${AppRoutes.kNotifications}/${AppRoutes.kNotificationDetails}',
                        ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(kDefaultRadius),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        'Acknowledge',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
