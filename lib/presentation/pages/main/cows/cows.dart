import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/presentation/widgets/cows/cow_list_tile.dart';
import 'package:client/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CowsWidget extends StatelessWidget {
  const CowsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actionsPadding: const EdgeInsets.only(right: 8.0),
        backgroundColor: AppColors.primary,
        title: ListTile(
          title: Text(
            'Cattle List',
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
            child: Icon(FontAwesomeIcons.filter, color: Colors.white, size: 20),
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
              child: InputField(
                hintText: 'Search by tag, breed, or status',
                prefixIcon: Icons.search,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.withValues(alpha: .2)),
                borderRadius: BorderRadius.circular(kDefaultRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...kCattleOverviewData.map((item) {
                    return Column(
                      children: [
                        Text(
                          item['content'],
                          style: textTheme.headlineMedium?.copyWith(
                            color: item['color'],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['label'],
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.danger,
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                ...kCattleList.map((cattle) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: CowListTile(
                      textTheme: textTheme,
                      cattle: cattle,
                      func: () => Get.toNamed(AppRoutes.kCattleProfile),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.kNewCattle),
        shape: const CircleBorder(),
        child: Icon(FontAwesomeIcons.plus),
      ),
    );
  }
}
