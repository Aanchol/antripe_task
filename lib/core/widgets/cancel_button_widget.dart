import 'package:flutter/material.dart';

import '../navigation/services/navigation_service.dart';
import 'measurement.dart';

Widget cancelButtonWidget() {
  return Align(
    alignment: Alignment.topRight,
    child: InkWell(
      onTap: () {
        NavigationService().goBack();
      },
      child: Icon(
        Icons.clear,
        size: measurement.margin(24),
      ),
    ),
  );
}
