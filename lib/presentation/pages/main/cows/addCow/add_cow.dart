import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/dropdown_field.dart';
import 'package:client/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class NewCowWidget extends StatelessWidget {
  final bool? action;

  const NewCowWidget({super.key, this.action});

  @override
  Widget build(BuildContext context) {
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
            'Add New Cattle',
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            'Register new livestock',
            style: TextStyle(color: AppColors.white),
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
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(kDefaultRadius),
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
                      leading: Icon(
                        FontAwesomeIcons.idCard,
                        color: AppColors.primary,
                      ),
                      title: Text(
                        'Basic Information',
                        style: textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text('Tag ID *', style: textTheme.labelLarge),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(child: InputField(hintText: 'Enter tag ID')),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            FontAwesomeIcons.qrcode,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Text('Name (Optional)', style: textTheme.labelLarge),
                    const SizedBox(height: 10.0),
                    InputField(hintText: 'Enter cattle name'),
                    const SizedBox(height: 15.0),
                    Text('Gender *', style: textTheme.labelLarge),
                    const SizedBox(height: 10.0),
                    MyDropDownWidget(
                      hint: 'Select gender',
                      itemList:
                          ['Male', 'Female'].map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                      errorText: 'Please select gender',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(kDefaultRadius),
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
                    leading: Icon(
                      FontAwesomeIcons.hourglassEnd,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Physical Details',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text('Breed *', style: textTheme.labelLarge),
                  const SizedBox(height: 10.0),
                  MyDropDownWidget(
                    hint: 'Select breed',
                    itemList:
                        ['Dairy', 'Beef', 'Dual Purpose'].map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    errorText: 'Please select gender',
                  ),
                  const SizedBox(height: 15.0),
                  Text('Type *', style: textTheme.labelLarge),
                  const SizedBox(height: 10.0),
                  MyDropDownWidget(
                    hint: 'Select type',
                    itemList:
                        ['Dairy', 'Beef', 'Dual Purpose'].map((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    errorText: 'Please select gender',
                  ),
                  const SizedBox(height: 15.0),
                  Text('Initial Weight (kg)', style: textTheme.labelLarge),
                  const SizedBox(height: 10.0),
                  InputField(hintText: 'Enter weight in kg'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: MyElevatedButton(
              textTheme: textTheme,
              label: 'Save Cattle',
              icon: Icon(
                FontAwesomeIcons.floppyDisk,
                color: AppColors.white,
                size: 20,
              ),
              func: () {},
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
