import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/data/cattle_data.dart';
import 'package:client/helper/extensions.dart';
import 'package:client/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CowListTile extends StatelessWidget {
  final TextTheme textTheme;
  final CattleModel cattle;

  const CowListTile({super.key, required this.textTheme, required this.cattle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey.withValues(alpha: .2)),
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultRadius),
              child: Image.asset(
                kCowImage,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    '#${cattle.tag} - ${cattle.name}',
                    style: textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${cattle.breed} - ${cattle.age}',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'Last check: ${Util.formatDate(cattle.lastCheck!)}',
                  style: textTheme.labelMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.heartPulse,
                      size: 18,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: cattle.status.color.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        cattle.status.name.capitalize(),
                        style: textTheme.bodyMedium?.copyWith(
                          color: cattle.status.color,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '25L/day',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  'Avg. yield',
                  style: textTheme.labelMedium?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
