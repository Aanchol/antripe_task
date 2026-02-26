import 'package:flutter/material.dart';

import '../navigation/services/navigation_service.dart';
import 'measurement.dart';

Future<dynamic> showCustomDialog({
  required Widget dialogChild,
  BoxDecoration? dialogDecoration,
  bool? isDismissible,
  double? height,
}) async {
  var result = await showGeneralDialog(
    context: NavigationService().getContext()!,
    barrierLabel: "Barrier",
    barrierDismissible: isDismissible ?? false,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (_, _, _) {
      return Dialog(
        insetPadding: EdgeInsets.all(measurement.margin(24)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          side: BorderSide(color: Colors.white24),
        ),
        child: dialogChild,
      );
    },
    transitionBuilder: (_, anim, _, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(opacity: anim, child: child),
      );
    },
  );

  return result;
}
