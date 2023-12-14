import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.label,
    required this.labelColor,
    required this.onPressed,
  });
  final String label;
  final Color labelColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: TextButton(
        style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        )),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: labelColor,
          ),
        ),
      ),
    );
  }
}
