import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/ui/pages/main/profile/farm_details/update_farm_controller.dart';
import 'package:client/ui/widgets/buttons.dart';
import 'package:client/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UpdateFarmWidget extends StatelessWidget {
  const UpdateFarmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpdateFarmController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: ListTile(
          title: Text(
            'Update Farm Info',
            style: textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: Column(
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
          Expanded(child: const SizedBox()),
          Padding(
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
            ),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              width: screenWidth,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(kDefaultRadius),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Farm Name', style: textTheme.labelLarge),
                  const SizedBox(height: 10.0),
                  InputField(
                    hintText: 'Enter the name of your farm',
                    suffixIcon: Icon(
                      FontAwesomeIcons.landmarkFlag,
                      color: AppColors.danger.withValues(alpha: .5),
                    ),
                    textController: controller.farmNameTextController,
                  ),
                  const SizedBox(height: 15.0),
                  Text('Location', style: textTheme.labelLarge),
                  const SizedBox(height: 10.0),
                  InputField(
                    hintText: 'Enter farm location',
                    suffixIcon: Icon(
                      FontAwesomeIcons.mapPin,
                      color: AppColors.danger.withValues(alpha: .5),
                    ),
                    textController: controller.farmLocationTextController,
                  ),
                  const SizedBox(height: 25.0),
                  Obx(
                    () => MyElevatedButton(
                      icon: Icon(FontAwesomeIcons.floppyDisk),
                      label: Text('Update Information'),
                      loading: controller.isLoading.value,
                      loadingBackgroundColor: AppColors.secondary,
                      onPressed:
                          controller.isLoading.isTrue
                              ? () {}
                              : () async => await controller.saveInfo(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
          Expanded(child: const SizedBox()),
        ],
      ),
    );
  }
}
