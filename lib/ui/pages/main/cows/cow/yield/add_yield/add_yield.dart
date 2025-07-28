import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/model/yield.dart';
import 'package:client/ui/pages/main/cows/cow/yield/add_yield/add_yield_controller.dart';
import 'package:client/ui/widgets/buttons.dart';
import 'package:client/ui/widgets/dropdown_field.dart';
import 'package:client/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddYieldWidget extends StatelessWidget {
  final String cattleId;

  AddYieldWidget({super.key, required this.cattleId});

  final List<int> _kQuickEntries = [25, 30, 35, 40];

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 20,
                      children: [
                        ...YieldType.values.map(
                          (YieldType yieldType) => GestureDetector(
                            onTap: () {
                              controller.yieldType.value = yieldType.name;
                            },
                            child: Obx(() {
                              String selectedYield = controller.yieldType.value;

                              return Container(
                                width: 100,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color:
                                      yieldType.name != selectedYield
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
                                      yieldType.icon,
                                      color:
                                          yieldType.name != selectedYield
                                              ? AppColors.textSecondary
                                              : AppColors.white,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      yieldType.name.toString().capitalize ??
                                          '',
                                      style: textTheme.labelLarge?.copyWith(
                                        color:
                                            yieldType.name != selectedYield
                                                ? AppColors.danger
                                                : AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      yieldType.unit.toString().capitalize ??
                                          '',
                                      style: textTheme.labelMedium?.copyWith(
                                        color:
                                            yieldType.name != selectedYield
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
                      suffixIcon:
                          controller.yieldType.value != 'milk'
                              ? Text(
                                'KG',
                                style: textTheme.headlineSmall?.copyWith(
                                  color: AppColors.danger.withValues(alpha: .6),
                                ),
                              )
                              : Text(
                                'L',
                                style: textTheme.headlineSmall?.copyWith(
                                  color: AppColors.danger.withValues(alpha: .6),
                                ),
                              ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ..._kQuickEntries.map(
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
                            child: Obx(
                              () => Text(
                                '$entry${controller.yieldType.value == 'milk' ? 'L' : 'kg'}',
                                style: textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Date Collected', style: textTheme.labelLarge),
                  InputField(
                    hintText: 'Select Date',
                    inputType: TextInputType.datetime,
                    onChanged: (value) {
                      if (value != null) {
                        controller.date = value;
                      }
                    },
                    suffixIcon: Icon(
                      FontAwesomeIcons.calendarDays,
                      color: AppColors.danger.withValues(alpha: .5),
                    ),
                  ),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 12,
                      children:
                          controller.yieldType.value == 'milk'
                              ? [
                                Text(
                                  'Milking Session',
                                  style: textTheme.labelLarge,
                                ),
                                MyDropDownWidget(
                                  hint: 'Select session',
                                  itemList:
                                      MilkingSession.values.map((session) {
                                        return DropdownMenuItem<String>(
                                          value: session.name,
                                          child: Text(
                                            session.name.capitalize ?? '',
                                          ),
                                        );
                                      }).toList(),
                                  errorText: 'Please select a session',
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      controller.milkingSession.value = value;
                                    }
                                  },
                                ),
                                Text(
                                  'Lactation Stage',
                                  style: textTheme.labelLarge,
                                ),
                                MyDropDownWidget(
                                  hint: 'Select stage',
                                  itemList:
                                      LactationStage.values.map((stage) {
                                        return DropdownMenuItem<String>(
                                          value: stage.name,
                                          child: Text(
                                            stage.name.capitalize ?? '',
                                          ),
                                        );
                                      }).toList(),
                                  errorText: 'Stage cannot be empty',
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      controller.lactationStage.value = value;
                                    }
                                  },
                                ),
                                Text(
                                  'Milk Quality Score',
                                  style: textTheme.labelLarge,
                                ),
                                InputField(
                                  hintText: '0.0',
                                  inputType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.milkQualityScore = value;
                                    }
                                  },
                                ),
                              ]
                              : [
                                Text(
                                  'Slaughter Weight',
                                  style: textTheme.labelLarge,
                                ),
                                Text(
                                  'Weight before slaughter',
                                  style: textTheme.labelMedium?.copyWith(
                                    color: AppColors.textSecondary.withValues(
                                      alpha: .4,
                                    ),
                                  ),
                                ),
                                InputField(
                                  hintText: '0.0',
                                  inputType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.slaughterWeight = value;
                                    }
                                  },
                                ),
                                Text(
                                  'Carcass Weight',
                                  style: textTheme.labelLarge,
                                ),
                                Text(
                                  'Usable meat yield',
                                  style: textTheme.labelMedium?.copyWith(
                                    color: AppColors.textSecondary.withValues(
                                      alpha: .4,
                                    ),
                                  ),
                                ),
                                InputField(
                                  hintText: '0.0',
                                  inputType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.carcassWeight = value;
                                    }
                                  },
                                ),
                                Text('Meat Grade', style: textTheme.labelLarge),
                                InputField(
                                  hintText: '0.0',
                                  inputType: TextInputType.number,
                                  onChanged: (value) {
                                    if (value != null) {
                                      controller.meatGrade = value;
                                    }
                                  },
                                ),
                              ],
                    ),
                  ),
                  Text('Notes (Optional)', style: textTheme.labelLarge),
                  InputField(
                    hintText: 'Additional Info',
                    inputType: TextInputType.datetime,
                    onChanged: (value) {
                      if (value != null) {
                        controller.notes = value;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(() {
              return MyElevatedButton(
                label: Text('Save Yield Record'),
                onPressed: controller.saveInfo,
                loading: controller.isLoading.value,
                icon: Icon(FontAwesomeIcons.floppyDisk),
                backgroundColor: AppColors.primary,
              );
            }),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
