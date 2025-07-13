import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:client/helper/extensions.dart';
import 'package:client/helper/util.dart';
import 'package:client/model/cattle.dart';
import 'package:flutter/material.dart';

class CowListTile extends StatelessWidget {
  final TextTheme textTheme;
  final CattleModel cattle;
  final VoidCallback func;
  final bool trailing;

  const CowListTile({
    super.key,
    required this.textTheme,
    required this.cattle,
    required this.func,
    this.trailing = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: Colors.grey.withValues(alpha: .2)),
          borderRadius: BorderRadius.circular(kDefaultRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(width: 8),
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
                  '${cattle.breed} - ${cattle.age} yrs',
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                if (cattle.lastCheck != null)
                  Text(
                    'Last check: ${Util.formatDate(cattle.lastCheck)}',
                    style: textTheme.labelMedium?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
            Expanded(child: Container()),
            if (trailing) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: cattle.status.color.withValues(alpha: .2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: FittedBox(
                          child: Text(
                            cattle.status.name.capitalize(),
                            style: textTheme.bodyMedium?.copyWith(
                              color: cattle.status.color,
                            ),
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
                    style: textTheme.labelMedium?.copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
