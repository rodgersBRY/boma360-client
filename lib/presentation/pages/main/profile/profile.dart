import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/widgets/appbar.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Container(
            height: screenHeight * .4,
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
                  child: MyAppBar(
                    actionIcon: FontAwesomeIcons.penToSquare,
                    title: Text('Profile'),
                    centerTitle: true,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Container(
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                              ),
                              child: Icon(
                                FontAwesomeIcons.camera,
                                color: AppColors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Brian Mawira',
                  style: textTheme.headlineLarge?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      child: Text(
                        'Verified Farmer',
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: AppColors.primary,
                        size: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Member since 2021',
                  style: textTheme.headlineSmall?.copyWith(
                    color: AppColors.white.withValues(alpha: .5),
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, kDefaultYOffset),
            child: Padding(
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
                        'Personal Information',
                        style: textTheme.headlineLarge,
                      ),
                    ),
                    MyListTile(
                      leadingWidget: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      title: 'Phone Number',
                      subtitle: '+254 (712) 413 243',
                      backgroundColor: AppColors.background,
                      trailingWidget: Icon(
                        FontAwesomeIcons.angleRight,
                        size: 16,
                      ),
                    ),
                    MyListTile(
                      leadingWidget: CircleAvatar(
                        backgroundColor: AppColors.danger,
                        child: Icon(
                          FontAwesomeIcons.solidEnvelope,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      title: 'Email Address',
                      subtitle: 'rodgersbry99@gmail.com',
                      backgroundColor: AppColors.background,
                      trailingWidget: Icon(
                        FontAwesomeIcons.angleRight,
                        size: 16,
                      ),
                    ),
                    MyListTile(
                      leadingWidget: CircleAvatar(
                        backgroundColor: AppColors.secondary,
                        child: Icon(
                          FontAwesomeIcons.map,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      title: 'Farm Location',
                      subtitle: 'Ukuu, Meru. Kenya',
                      backgroundColor: AppColors.background,
                      trailingWidget: Icon(
                        FontAwesomeIcons.angleRight,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 22),
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
                      'Account Settings',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  MyListTile(
                    leadingWidget: CircleAvatar(
                      backgroundColor: AppColors.info,
                      child: Icon(
                        FontAwesomeIcons.lock,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    title: 'Change Password',
                    subtitle: 'Update your account password',
                    backgroundColor: AppColors.background,
                    trailingWidget: Icon(FontAwesomeIcons.angleRight, size: 16),
                  ),
                  MyListTile(
                    leadingWidget: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Icon(
                        FontAwesomeIcons.bell,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    title: 'Notification Preferences',
                    subtitle: 'Manage alerts and notifications',
                    backgroundColor: AppColors.background,
                    trailingWidget: Icon(FontAwesomeIcons.angleRight, size: 16),
                  ),
                  MyListTile(
                    leadingWidget: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        FontAwesomeIcons.shieldHalved,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    title: 'Privacy Settings',
                    subtitle: 'Control your data and privacy',
                    backgroundColor: AppColors.background,
                    trailingWidget: Icon(FontAwesomeIcons.angleRight, size: 16),
                  ),
                  MyListTile(
                    leadingWidget: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Icon(
                        FontAwesomeIcons.solidCircleQuestion,
                        color: AppColors.white,
                        size: 18,
                      ),
                    ),
                    title: 'Help & Support',
                    subtitle: 'Get help and contact support',
                    backgroundColor: AppColors.background,
                    trailingWidget: Icon(FontAwesomeIcons.angleRight, size: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: MyElevatedButton(
              textTheme: textTheme,
              label: 'Log Out',
              func: () => Get.offNamed(AppRoutes.kLogin),
              backgroundColor: Colors.red,
              icon: Icon(FontAwesomeIcons.arrowRightFromBracket),
              textStyle: textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
