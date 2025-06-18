import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final TextTheme textTheme;
  final String subtitle;
  final String title;
  final Color color;
  final Widget leadWidget;
  final bool shadow;

  const CustomTile({
    super.key,
    required this.textTheme,
    required this.leadWidget,
    required this.subtitle,
    required this.title,
    required this.color,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow:
            shadow
                ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ]
                : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadWidget,
          const SizedBox(height: 15.0),
          Text(title, style: textTheme.headlineMedium),
          const SizedBox(height: 15.0),
          Text(
            subtitle,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
