import 'package:client/config/constants.dart';
import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final Widget leadingWidget;
  final String title;
  final String subtitle;
  final Widget? trailingWidget;
  final Color backgroundColor;

  const MyListTile({
    super.key,
    required this.leadingWidget,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: ListTile(
        leading: leadingWidget,
        title: Text(
          title,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.textPrimary),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.labelLarge?.copyWith(color: AppColors.textSecondary),
        ),
        trailing: trailingWidget,
      ),
    );
  }
}
