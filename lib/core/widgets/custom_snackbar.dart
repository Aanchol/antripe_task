import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'measurement.dart';

void showCustomSnackBar(
    {required String msg, Color? bgColor, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: measurement.margin(70),
        right: measurement.margin(12),
        left: measurement.margin(12),
      ),
      backgroundColor: bgColor,
      content: customText(
        text: msg,
        textStyle: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 5),
    ),
  );
}
