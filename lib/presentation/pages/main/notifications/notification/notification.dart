import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/helper/extensions.dart';
import 'package:client/model/cattle.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({super.key});

  final List<Map<String, dynamic>> yieldInfo = [
    {'quantity': 7, 'period': 'Today'},
    {'quantity': 11, 'period': 'Yesterday'},
    {'quantity': 12, 'period': '2 days ago'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    final cow = kCattleList.first;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: ListTile(
          title: Text(
            'Alerts Details',
            style: textTheme.headlineMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          subtitle: Text(
            'View complete information',
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
                padding: const EdgeInsets.symmetric(vertical: 28),
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
                  spacing: 12,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.warning.withValues(alpha: .3),
                      child: Icon(
                        FontAwesomeIcons.bottleDroplet,
                        size: 50,
                        color: AppColors.warning,
                      ),
                    ),
                    Text(
                      'Low Milk Yield Detected',
                      style: textTheme.titleLarge,
                    ),
                    Row(
                      spacing: 9,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidClock,
                          color: Colors.grey,
                          size: 15,
                        ),

                        Text('June 14, 2025 - 6.45 PM'),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.warning,
                        borderRadius: BorderRadius.circular(kDefaultRadius),
                      ),
                      child: Text(
                        'medium priority'.toUpperCase(),
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FontAwesomeIcons.circleInfo,
                      color: AppColors.primary,
                    ),
                    title: Text('Alert Details', style: textTheme.titleMedium),
                  ),
                  Text(
                    'Milk yield from Tag #0345 has dropped significantly to 5 liters today, which is well below the average of 12 liters for this animal.',
                  ),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.amber.withValues(alpha: .1),
                      border: BoxBorder.fromLTRB(
                        left: BorderSide(color: AppColors.warning, width: 6),
                      ),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'Recommendation:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                'Check animal health, review feeding schedule, and monitor for signs of illness or stress.',
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FontAwesomeIcons.chartLine,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Yield Comparison',
                      style: textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        yieldInfo
                            .map(
                              (item) => Column(
                                spacing: 4,
                                children: [
                                  Container(
                                    width: 90,
                                    padding: const EdgeInsets.all(22),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: .2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        kDefaultRadius,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${item['quantity']}L",
                                        style: textTheme.titleLarge?.copyWith(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(item['period']),
                                ],
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FontAwesomeIcons.cow,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Animal Information',
                      style: textTheme.titleMedium,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Tag ID'),
                    trailing: Text(
                      cow.tag,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: .3),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Name'),
                    trailing: Text(
                      cow.name,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: .3),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Breed'),
                    trailing: Text(
                      cow.breed,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: .3),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Age'),
                    trailing: Text(
                      cow.age,
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: .3),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Health Status'),
                    trailing: Text(
                      cow.status.name.capitalize(),
                      style: textTheme.bodyLarge?.copyWith(
                        color: cow.status.color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: MyElevatedButton(
              func: () {},
              textTheme: textTheme,
              icon: Icon(FontAwesomeIcons.cow),
              label: 'View Animal Profile',
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                    height: 50,
                    textTheme: textTheme,
                    icon: Icon(FontAwesomeIcons.check),
                    backgroundColor: AppColors.warning,
                    label: 'Acknowledge',
                    func: () {},
                    textStyle: textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MyElevatedButton(
                    height: 50,
                    textTheme: textTheme,
                    icon: Icon(FontAwesomeIcons.plus),
                    label: 'Add Action',
                    func: () {},
                    backgroundColor: AppColors.info,
                    textStyle: textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
