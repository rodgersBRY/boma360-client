import 'dart:ffi';

import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/helper/util.dart';
import 'package:client/model/farm.dart';
import 'package:client/presentation/pages/main/main_controller.dart';
import 'package:client/presentation/pages/main/profile/profile_controller.dart';
import 'package:client/presentation/widgets/appbar.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/item_list_tile.dart';
import 'package:client/presentation/widgets/spin_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final mainController = Get.find<MainController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Obx(() {
        var user = mainController.user.value;

        if (user != null) {
          final displayName = user.userMetadata!['displayName'];
          final bool isVerified = user.userMetadata!['email_verified'];
          final phone = user.userMetadata!['phone'];
          final email = user.email;

          return ListView(
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
                        popIcon: false,
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
                      displayName,
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
                            color:
                                isVerified ? Colors.green : Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Text(
                            isVerified ? 'Farmer Verified' : 'Not Verified',
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
                      'Member since ${Util.formatDate(DateTime.parse(user.createdAt), pattern: 'y')}',
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
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
                          subtitle: phone ?? '',
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
                          subtitle: email ?? '',
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
                          title: 'Farm Details',
                          subtitle: 'Mburugu Estate',
                          text: 'Ukuu, Meru. kenya',
                          backgroundColor: AppColors.background,
                          trailingWidget: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(FontAwesomeIcons.penToSquare, size: 16),
                            onPressed: () async {
                              var farmInfo = await Get.toNamed(
                                AppRoutes.kUpdateFarm,
                              );

                              controller.farm.value = FarmModel.fromJson(
                                farmInfo,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
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
                        trailingWidget: Icon(
                          FontAwesomeIcons.angleRight,
                          size: 16,
                        ),
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
                        trailingWidget: Icon(
                          FontAwesomeIcons.angleRight,
                          size: 16,
                        ),
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
                        trailingWidget: Icon(
                          FontAwesomeIcons.angleRight,
                          size: 16,
                        ),
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
                        trailingWidget: Icon(
                          FontAwesomeIcons.angleRight,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Obx(
                  () => MyElevatedButton(
                    label:
                        controller.isLoading.value
                            ? SpinWidget()
                            : Text(
                              'Log Out',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                    func:
                        controller.isLoading.value
                            ? null
                            : () => controller.logout(),
                    backgroundColor:
                        controller.isLoading.value
                            ? Colors.red.withValues(alpha: .4)
                            : Colors.red,
                    icon:
                        controller.isLoading.value
                            ? null
                            : Icon(FontAwesomeIcons.arrowRightFromBracket),
                  ),
                ),
              ),

              const SizedBox(height: 28),
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
