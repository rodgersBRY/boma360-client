import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/ui/pages/main/cows/cow/yield/add_yield/add_yield_controller.dart';
import 'package:client/ui/widgets/buttons.dart';
import 'package:client/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddYieldWidget extends StatelessWidget {
  final String cattleId;

  AddYieldWidget({super.key, required this.cattleId});

  final List<int> _quickEntries = [25, 30, 35, 40];

  final List<Map<String, dynamic>> _yieldTypes = [
    {"icon": FontAwesomeIcons.bottleDroplet, "name": "milk", "desc": "liters"},
    {
      "icon": FontAwesomeIcons.weightScale,
      "name": "weight",
      "desc": "kilograms",
    },
    {"icon": FontAwesomeIcons.bone, "name": "meat", "desc": "kilograms"},
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddYieldController>();

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
                        ..._yieldTypes.map(
                          (yieldType) => GestureDetector(
                            onTap: () {
                              controller.yieldType.value = yieldType['name'];
                            },
                            child: Obx(() {
                              String selectedYield = controller.yieldType.value;

                              return Container(
                                width: 100,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color:
                                      yieldType['name'] != selectedYield
                                          ? AppColors.primary.withValues(
                                            alpha: .2,
                                          )
                                          : AppColors.primary,
                                  borderRadius: BorderRadius.circular(
                                    kDefaultRadius,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      yieldType['icon'],
                                      color:
                                          yieldType['name'] != selectedYield
                                              ? AppColors.textSecondary
                                              : AppColors.white,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      yieldType['name'].toString().capitalize ??
                                          '',
                                      style: textTheme.labelLarge?.copyWith(
                                        color:
                                            yieldType['name'] != selectedYield
                                                ? AppColors.danger
                                                : AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      yieldType['desc'].toString().capitalize ??
                                          '',
                                      style: textTheme.labelMedium?.copyWith(
                                        color:
                                            yieldType['name'] != selectedYield
                                                ? AppColors.danger.withValues(
                                                  alpha: .7,
                                                )
                                                : AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
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
                  Text('Yield Details', style: textTheme.titleMedium),
                  Text('Quantity', style: textTheme.labelLarge),
                  Obx(() {
                    return InputField(
                      hintText: '0.0',
                      inputType: TextInputType.number,
                      textController: TextEditingController(
                        text: controller.quantity.value,
                      ),
                      suffixIcon: Text('L'),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ..._quickEntries.map(
                        (entry) => GestureDetector(
                          onTap: () {
                            controller.quantity.value = entry.toString();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withValues(alpha: .3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '${entry}L',
                              style: textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Date', style: textTheme.labelLarge),
                  InputField(
                    hintText: 'Select Date',
                    inputType: TextInputType.datetime,
                    suffixIcon: Icon(
                      FontAwesomeIcons.calendarDays,
                      color: AppColors.danger.withValues(alpha: .5),
                    ),
                  ),
                  Text('Notes (Optional)', style: textTheme.labelLarge),
                  InputField(
                    hintText: 'Select Date',
                    inputType: TextInputType.datetime,
                    // textController: ,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: MyElevatedButton(
              label: Text('Save Yield Record'),
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.floppyDisk),
              backgroundColor: AppColors.primary,
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
