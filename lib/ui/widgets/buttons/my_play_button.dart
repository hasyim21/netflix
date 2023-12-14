import 'package:flutter/material.dart';

import '../../../theme/my_colors.dart';

class MyIconTextButton extends StatelessWidget {
  const MyIconTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.0,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.white,
        ),
        icon: Icon(
          icon,
          size: 25.0,
          color: MyColors.black,
        ),
        label: Text(
          label,
          style: const TextStyle(
            color: MyColors.black,
          ),
        ),
      ),
    );
  }
}
