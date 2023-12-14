import 'package:flutter/material.dart';

Future<dynamic> myAlertDialog(
    {required BuildContext context,
    required String title,
    required String content}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
