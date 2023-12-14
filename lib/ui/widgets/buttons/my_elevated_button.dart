import 'package:flutter/material.dart';

import '../../../theme/my_colors.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.red,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: MyColors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
