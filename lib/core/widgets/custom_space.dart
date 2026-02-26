import 'package:flutter/material.dart';
import 'measurement.dart';

Widget customSpace({double? height = 0, double? width = 0}) {
  return SizedBox(
    height: measurement.margin(height!),
    width: measurement.margin(width!),
  );
}
