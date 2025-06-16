import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class OverviewTile extends StatelessWidget {
  final TextTheme textTheme;
  final IconData icon;
  final String text;
  final int number;

  const OverviewTile({
    super.key,
    required this.textTheme,
    required this.icon,
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50),
          const SizedBox(height: 5.0),
          Text('$number', style: textTheme.headlineLarge),
          const SizedBox(height: 5.0),
          Text(
            text,
            style: textTheme.headlineMedium?.copyWith(
              //fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
