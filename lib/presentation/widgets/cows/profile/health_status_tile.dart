import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class HealthStatusTile extends StatelessWidget {
  final TextTheme textTheme;
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;

  const HealthStatusTile({
    super.key,
    required this.textTheme,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: ListTile(
        leading: Icon(icon, color: color, size: 18),
        title: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.labelLarge?.copyWith(color: AppColors.textSecondary),
        ),
        trailing: Text(
          trailing,
          style: textTheme.labelMedium?.copyWith(color: color),
        ),
      ),
    );
  }
}
