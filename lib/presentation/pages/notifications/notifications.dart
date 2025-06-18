import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
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
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
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
                  MyElevatedButton(
                    textTheme: textTheme,
                    label: 'Mark All as Read',
                    func: () {},
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
