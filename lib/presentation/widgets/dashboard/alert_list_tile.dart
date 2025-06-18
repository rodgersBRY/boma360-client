import 'package:client/config/constants.dart';
import 'package:flutter/material.dart';

class AlertListTile extends StatelessWidget {
  final TextTheme textTheme;
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  const AlertListTile({
    super.key,
    required this.textTheme,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(kDefaultRadius),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: Icon(icon),
        ),
        title: Text(title, style: textTheme.headlineMedium),
        subtitle: Text(subtitle, style: textTheme.headlineSmall),
      ),
    );
  }
}
