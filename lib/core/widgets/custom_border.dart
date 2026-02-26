import 'package:flutter/material.dart';

Widget customBorder({double? height, double? width, Color? bgColor}) {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          //Color(0xFF868686),
          Color(0xFF3B3B3B),
          Color(0xFF4D4D4D),
          Color(0xFF1C1B1B),
          //Color(0xFF202020),
        ],
      ),
    ),
    //color: bgColor ?? AppColors.black50,
    height: height ?? 1,
    width: width ?? double.maxFinite,
  );
}
