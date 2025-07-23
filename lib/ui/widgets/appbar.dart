import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final IconData actionIcon;
  final IconData? leadingIcon;
  final Widget title;
  final bool centerTitle;
  final bool? popIcon;

  const MyAppBar({
    super.key,
    required this.actionIcon,
    this.leadingIcon,
    required this.title,
    this.centerTitle = false,
    this.popIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading:
          popIcon == true
              ? Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .2),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(12),
                    bottom: Radius.circular(12),
                  ),
                ),
                child: Icon(leadingIcon, color: Colors.white, size: 20),
              )
              : null,
      automaticallyImplyLeading: false,
      title: title,
      // ListTile(
      //   contentPadding: EdgeInsets.zero,
      //   textColor: AppColors.white,
      //   leading:
      //       popIcon == true
      //           ? Container(
      //             height: 50,
      //             padding: const EdgeInsets.all(10),
      //             decoration: BoxDecoration(
      //               color: Colors.white.withValues(alpha: .2),
      //               borderRadius: BorderRadius.vertical(
      //                 top: Radius.circular(12),
      //                 bottom: Radius.circular(12),
      //               ),
      //             ),
      //             child: Icon(leadingIcon, color: Colors.white, size: 20),
      //           )
      //           : null,
      // ),
      actions: [
        Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .2),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
              bottom: Radius.circular(12),
            ),
          ),
          child: Icon(actionIcon, color: Colors.white, size: 20),
        ),
      ],
    );
  }
}
