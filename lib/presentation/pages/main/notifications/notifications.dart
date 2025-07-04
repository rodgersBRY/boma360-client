import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/notifications.dart';
import 'package:client/presentation/widgets/cows/notifications/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: ListTile(
          title: Text(
            'Alerts & Notifications',
            style: textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            'Stay updated with your farm',
            style: textTheme.headlineSmall?.copyWith(
              color: const Color.fromARGB(255, 213, 213, 213),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
          Transform.translate(
            offset: Offset(0, kDefaultYOffset),
            child: Padding(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      ['All', 'Urgent', 'Health', 'Yield']
                          .map(
                            (item) => Container(
                              padding: const EdgeInsets.all(22),
                              decoration: BoxDecoration(
                                color:
                                    item == 'All'
                                        ? AppColors.primary
                                        : AppColors.white,
                                borderRadius: BorderRadius.circular(
                                  kDefaultRadius,
                                ),
                              ),
                              child: Text(
                                item,
                                style: textTheme.bodyLarge?.copyWith(
                                  color:
                                      item == 'All'
                                          ? AppColors.white
                                          : AppColors.textSecondary,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Text('Today', style: textTheme.headlineMedium),
          ),
          ...kNotifications.map(
            (notification) => Container(
              margin: const EdgeInsets.only(bottom: 22),
              child: NotificationCard(
                screenWidth: screenWidth,
                textTheme: textTheme,
                notification: notification,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
