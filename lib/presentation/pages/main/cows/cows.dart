import 'package:client/config/constants.dart';
import 'package:client/config/routes.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/model/cattle.dart';
import 'package:client/presentation/pages/main/cows/cows_controller.dart';
import 'package:client/presentation/widgets/cows/cow_list_tile.dart';
import 'package:client/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CowsWidget extends StatelessWidget {
  const CowsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CowsController>();

    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetch(refresh: true);
      },
      child: Scaffold(
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
              child: Icon(
                FontAwesomeIcons.filter,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
        body: Obx(() {
          bool isLoading = controller.isLoading.value;
          bool isFailed = controller.isFailed.value;
          List<CattleModel?> cows = controller.cattle;

          if (isLoading) {
            return SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SpinKitCircle(color: AppColors.danger)],
              ),
            );
          } else if (isFailed) {
            return Container();
          } else {
            return ListView(
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
                      child: InputField(
                        hintText: 'Search by tag, breed, or status',
                        prefixIcon: Icons.search,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: .2),
                      ),
                      borderRadius: BorderRadius.circular(kDefaultRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${cows.length}',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.danger,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Total',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.danger,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${cows.where((cow) => cow!.status == Status.healthy).length}',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Healthy',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.danger,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${cows.where((cow) => cow!.status == Status.attention).length}',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.warning,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Attention',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.danger,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${cows.where((cow) => cow!.status == Status.pregnant).length}',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.info,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Pregnant',
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.danger,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                if (cows.isEmpty)
                  SizedBox(
                    height: screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No Cows Added',
                            style: textTheme.titleLarge?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (cows.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                    ),
                    child: Column(
                      children: [
                        ...cows.map((cattle) {
                          if (cattle != null) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: CowListTile(
                                textTheme: textTheme,
                                cattle: cattle,
                                func: () async {
                                  await Get.toNamed(
                                    '${AppRoutes.kCattleProfile}${cattle.id}',
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        }),
                      ],
                    ),
                  ),
              ],
            );
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(AppRoutes.kNewCattle),
          shape: const CircleBorder(),
          child: Icon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }
}
