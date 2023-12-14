import 'package:flutter/material.dart';

import '../../theme/my_colors.dart';

// ignore: must_be_immutable
class MyTextFormField extends StatefulWidget {
  MyTextFormField({
    super.key,
    required this.hintText,
    // this.initialValue = '',
    required TextEditingController textController,
    this.isPassword = false,
    required this.obscureText,
  }) : _textController = textController;

  final String hintText;
  // final String? initialValue;
  final TextEditingController _textController;
  final bool? isPassword;
  bool obscureText;

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: TextFormField(
        // initialValue: widget.initialValue,
        controller: widget._textController,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          fillColor: MyColors.greyDark1,
          hintText: widget.hintText,
          filled: true,
          isDense: true,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          contentPadding: const EdgeInsets.all(15.0),
          suffixIcon: (widget.isPassword!)
              ? Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      widget.obscureText = !widget.obscureText;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: MyColors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
