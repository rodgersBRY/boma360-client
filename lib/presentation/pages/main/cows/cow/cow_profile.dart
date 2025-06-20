import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/presentation/widgets/buttons.dart';
import 'package:client/presentation/widgets/custom_tile.dart';
import 'package:client/presentation/widgets/item_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CowProfileWidget extends StatelessWidget {
  const CowProfileWidget({super.key});

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
            'Cattle Profile',
            style: textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white.withValues(alpha: .2),
            child: Icon(FontAwesomeIcons.cow, color: Colors.white, size: 20),
          ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                            child: Image.asset(
                              kCowImage,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                'Tag #0345',
                                style: textTheme.headlineMedium,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Holstein Friesian',
                              style: textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.briefcase,
                                  size: 13,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(width: 8),
                                Text('3.5 years', style: textTheme.bodySmall),
                                const SizedBox(width: 12),
                                Icon(
                                  FontAwesomeIcons.marsStrokeUp,
                                  size: 13,
                                  color: Colors.pink,
                                ),
                                const SizedBox(width: 8),
                                Text('Female', style: textTheme.bodySmall),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      spacing: 12,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Text(
                            'Healthy',
                            style: textTheme.labelMedium?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.info.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Text(
                            'Pregnant',
                            style: textTheme.labelMedium?.copyWith(
                              color: AppColors.info,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withValues(alpha: .2),
                            borderRadius: BorderRadius.circular(kDefaultRadius),
                          ),
                          child: Text(
                            'High Yield',
                            style: textTheme.labelMedium?.copyWith(
                              color: AppColors.warning,
                              fontWeight: FontWeight.bold,
                            ),
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SizedBox(
              height: 420,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // preve
                children: [
                  ...kCattleKeyStats.map((item) {
                    return CustomTile(
                      color: AppColors.white,
                      textTheme: textTheme,
                      leadWidget: Icon(
                        item['icon'],
                        size: 25,
                        color: item['iconColor'],
                      ),
                      title: item['title'],
                      subtitle: Column(
                        children: [
                          Text(
                            item['subtitle'],
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item['subtext'],
                            style: textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: item['subtextColor'],
                            ),
                          ),
                        ],
                      ),
                      shadow: true,
                      func: () {},
                    );
                  }),
                ],
              ),
            ),
          ),
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
                      'Health Status',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  ...kCattleHealthStatus.map(
                    (item) => MyListTile(
                      leadingWidget: Icon(
                        item['icon'],
                        color: item['color'],
                        size: 18,
                      ),
                      title: item['title'],
                      subtitle: item['subtitle'],
                      backgroundColor: item['color'].withValues(alpha: .2),
                      trailingWidget: Text(
                        item['trailing'],
                        style: TextStyle(color: item['color']),
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
            child: Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                    height: 50,
                    textTheme: textTheme,
                    icon: Icon(FontAwesomeIcons.penToSquare),
                    label: 'Edit Profile',
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
                    label: 'Add Yield',
                    func: () {},
                    backgroundColor: AppColors.danger,
                    textStyle: textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: AppColors.primary.withValues(alpha: .4),
                  width: 3.0,
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.fileCircleMinus,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'View Medical History',
                    style: textTheme.headlineMedium?.copyWith(
                      color: AppColors.primary,
                    ),
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
