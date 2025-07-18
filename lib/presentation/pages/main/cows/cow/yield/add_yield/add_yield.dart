import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/pages/main/cows/cow/yield/add_yield/add_yield_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddYieldWidget extends StatelessWidget {
  final String cattleId;

  const AddYieldWidget({super.key, required this.cattleId});

  @override
  Widget build(BuildContext context) {
    Get.find<AddYieldController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actionsPadding: const EdgeInsets.only(right: 8.0),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: Colors.white.withValues(alpha: .2),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        title: ListTile(
          title: Text(
            'Record Yield',
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
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
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Container(
                padding: const EdgeInsets.all(28),
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
                  spacing: 12,
                  children: [
                    Text('Yield Type', style: textTheme.titleMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.bottleDroplet),
                              const SizedBox(height: 10),
                              Text(
                                "Milk",
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.danger,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Liters",
                                style: textTheme.labelMedium?.copyWith(
                                  color: AppColors.danger.withValues(alpha: .7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Column(
                            children: [
                              Icon(FontAwesomeIcons.weightScale),
                              const SizedBox(height: 10),
                              Text(
                                "Weight",
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.danger,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Kilograms",
                                style: textTheme.labelMedium?.copyWith(
                                  color: AppColors.danger.withValues(alpha: .7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.bone,
                                color: AppColors.danger,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Meat",
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.danger,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Kilograms",
                                style: textTheme.labelMedium?.copyWith(
                                  color: AppColors.danger.withValues(alpha: .7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              'Key Statistics',
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
