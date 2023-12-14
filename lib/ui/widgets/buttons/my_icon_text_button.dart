import 'package:flutter/material.dart';

import '../../../theme/my_colors.dart';

class MyIconTextButton extends StatelessWidget {
  const MyIconTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor,
    this.labelColor,
    this.backgroundColor,
  });

  final IconData icon;
  final Color? iconColor;
  final String label;
  final Color? labelColor;
  final Color? backgroundColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? MyColors.white,
        ),
        icon: Icon(
          icon,
          size: 25.0,
          color: iconColor ?? MyColors.black,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: labelColor ?? MyColors.black,
          ),
        ),
      ),
    );
  }
}
