import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/app_color.dart';
import 'measurement.dart';

void showCustomToast({
  required String msg,
  Color? bg,
  ToastGravity? gravity,
  Toast? length,
}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: length ?? Toast.LENGTH_SHORT,
    gravity: gravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: bg ?? AppColors.black,
    textColor: Colors.white,
    fontSize: measurement.margin(16),
  );
}
