import 'package:flutter/material.dart';

import '../../core/widgets/measurement.dart';
import 'app_color.dart';

class AppDecorations {
  // static BoxDecoration get commonButtonRound => const BoxDecoration(
  //       color: ColorUtils.green500,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(8),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: ColorUtils.black200,
  //           offset: Offset(0, 5),
  //           blurRadius: 0,
  //           spreadRadius: 0,
  //         ),
  //       ],
  //     );

  static BoxDecoration get imageBackground => BoxDecoration(
    color: AppColors.white,
    image: const DecorationImage(
      image: AssetImage("assets/images/animation/red_circle.gif"),
      fit: BoxFit.contain,
      alignment: Alignment.center,
    ),
  );

  static BoxDecoration get authBackground => const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/jpg/login_bg.jpg'),
      fit: BoxFit.cover,
      //opacity: 0.4,
      //colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
    ),
  );

  static BoxDecoration get roundCornerLightCyan => BoxDecoration(
    color: AppColors.cyan100,
    borderRadius: const BorderRadius.all(Radius.circular(8)),
  );

  // static BoxDecoration get backgroundGradientColor => const BoxDecoration(
  //       color: Color(0xFF202020),
  //       // gradient: LinearGradient(
  //       //   begin: Alignment.topCenter,
  //       //   end: Alignment.bottomCenter,
  //       //   colors: [
  //       //     //Color(0xFF868686),
  //       //     Color(0xFF3B3A3A),
  //       //     Color(0xFF282828),
  //       //
  //       //     //Color(0xFF202020),
  //       //   ],
  //       // ),
  //     );

  static BoxDecoration get roundCornerCyan200 =>
      roundCornerLightCyan.copyWith(color: AppColors.cyan200);

  static BoxDecoration get roundCornerPrimary => BoxDecoration(
    color: AppColors.black,
    // borderRadius: BorderRadius.circular(8),
  );

  static BoxDecoration get roundCornerPrimarySh => roundCornerPrimary.copyWith(
    color: AppColors.black800,
    // border: Border.all(color: AppColors.black),
    // boxShadow: [
    //   const BoxShadow(
    //     color: Colors.black,
    //     offset: Offset(0, 0),
    //     blurRadius: 1,
    //     spreadRadius: .5,
    //   ),
    // ],
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration get greyShadeRoundCorner => BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: 0.18),
        spreadRadius: -10,
        blurRadius: 5,
        offset: const Offset(0.0, 0.5), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration get profileRoundCorner => BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        spreadRadius: 1,
        blurRadius: 2,
        offset: const Offset(0, 0.5), // changes position of shadow
      ),
    ],
  );

  static BoxDecoration get darkRoundCorner => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get goldenRoundCorner => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.golden),
  );

  static BoxDecoration get silverRoundCorner => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.silver),
  );

  static BoxDecoration get platinumRoundCorner => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.platinum),
  );

  static BoxDecoration get goldGradientRoundCorner => BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFFFFFFD6), Color(0xFFFFD700), Color(0xFFFFFFD6)],
    ),
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get silverGradientRoundCorner => BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color(0xFF7D7D7A),
        Color(0xFFB3B6B5),
        Color(0xFF696968),
        Color(0xFFB3B6B5),
        Color(0xFF7D7D7A),
      ],
    ),
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get platinumGradientRoundCorner => BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFFF0D1A1), Color(0xFFD9A066), Color(0xFFF0D1A1)],
    ),
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration get profileContainer => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white),
  );

  static BoxDecoration get darkCircleContainer => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(100),
    boxShadow: const [
      BoxShadow(
        color: Colors.white12,
        offset: Offset(-1.0, -1.0),
        blurRadius: 8,
        spreadRadius: 5,
      ),
    ],
  );

  static BoxDecoration get viewImageContainer => BoxDecoration(
    color: AppColors.black,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.white),
  );

  static BoxDecoration get bgImageContainer => const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/png/background_img.png'),
      fit: BoxFit.cover,
    ),
  );

  static BoxDecoration get darkSharpCorner =>
      BoxDecoration(color: AppColors.black);

  static BoxDecoration get switchButtonShadow => BoxDecoration(
    borderRadius: BorderRadius.circular(measurement.margin(20)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withValues(alpha: 0.2),
        spreadRadius: 1,
        blurRadius: 9,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static BoxDecoration get darkRoundCornerWithoutShadow => BoxDecoration(
    color: AppColors.black750,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: AppColors.black),
    // boxShadow: const [
    //   BoxShadow(
    //     color: Colors.white38,
    //     offset: Offset(-1.0, -1.0),
    //     blurRadius: 5,
    //     spreadRadius: .5,
    //   ),
    //   BoxShadow(
    //     color: Colors.black,
    //     offset: Offset(1.0, 1.0),
    //     blurRadius: 5,
    //     spreadRadius: 1,
    //   ),
    // ],
  );

  static BoxDecoration get offlineRoundCorner => darkRoundCorner.copyWith(
    border: Border.all(width: measurement.margin(1), color: Colors.amber),
  );

  static BoxDecoration get backButtonDecoration => BoxDecoration(
    color: AppColors.black750,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Colors.white30,
        offset: Offset(-0.3, -0.3),
        blurRadius: 3,
        spreadRadius: .5,
      ),
      BoxShadow(
        color: Colors.black87,
        offset: Offset(0.5, 0.5),
        blurRadius: 3,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration get leftCornerShadow => darkRoundCorner.copyWith(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(measurement.margin(16)),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.white38,
        offset: Offset(-1.0, -1.0),
        blurRadius: 5,
        spreadRadius: .5,
      ),
      BoxShadow(
        color: Colors.black,
        offset: Offset(1.0, 1.0),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration get leftBottomCornerShadow => darkRoundCorner.copyWith(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(measurement.margin(16)),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.white38,
        offset: Offset(-1.0, 1.0),
        blurRadius: 5,
        spreadRadius: .5,
      ),
      BoxShadow(
        color: Colors.black,
        offset: Offset(1.0, -1.0),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration get rightCornerShadow => darkRoundCorner.copyWith(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(measurement.margin(16)),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.white38,
        offset: Offset(1.0, -1.0),
        blurRadius: 5,
        spreadRadius: .5,
      ),
      BoxShadow(
        color: Colors.black,
        offset: Offset(-1.0, 1.0),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration get rightBottomCornerShadow => darkRoundCorner.copyWith(
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(measurement.margin(16)),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.white38,
        offset: Offset(1.0, 1.0),
        blurRadius: 5,
        spreadRadius: .5,
      ),
      BoxShadow(
        color: Colors.black,
        offset: Offset(-1.0, -1.0),
        blurRadius: 5,
        spreadRadius: 1,
      ),
    ],
  );

  static BoxDecoration get whiteCircle => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(2000),
  );

  static BoxDecoration get blackCircle => BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.circular(2000),
  );

  static BoxDecoration get roundCornerPrimary20 => BoxDecoration(
    color: AppColors.primary.withValues(alpha: 0.1),
    borderRadius: BorderRadius.circular(12),
  );

  static BoxDecoration get wbkGradientDecoration => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Colors.white, Colors.black87],
    ),
  );

  static BoxDecoration get alertButtonBg => BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: AppColors.redDark,
        offset: const Offset(0, 0),
        blurRadius: 2,
        spreadRadius: 2,
      ),
    ],
    borderRadius: BorderRadius.circular(100),
    gradient: RadialGradient(
      colors: [AppColors.redDeep10, AppColors.redDeep10],
    ),
  );

  static BoxDecoration get bwGradientDecoration => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Colors.black87, Colors.white],
    ),
  );

  static BoxDecoration get blackCornerRoundOP => BoxDecoration(
    color: AppColors.blackOp50,
    borderRadius: BorderRadius.all(Radius.circular(measurement.margin(16))),
  );

  static BoxDecoration get blackBottomRoundOP => blackCornerRoundOP.copyWith(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(measurement.margin(16)),
      bottomRight: Radius.circular(measurement.margin(16)),
    ),
  );

  static BoxDecoration get blackCornerRound => BoxDecoration(
    color: AppColors.black24,
    borderRadius: BorderRadius.all(Radius.circular(measurement.margin(12))),
  );

  static BoxDecoration get black10CornerRound =>
      blackCornerRound.copyWith(color: AppColors.black10);

  static BoxDecoration get yellowBorder =>
      BoxDecoration(border: Border.all(color: AppColors.orange900, width: 1.2));

  static BoxDecoration get onlyDecoration =>
      yellowBorder.copyWith(border: Border.all(width: 0.0));

  static BoxDecoration get black10CornerRoundBorder =>
      black10CornerRound.copyWith(
        border: Border.all(
          color: AppColors.black850,
          width: measurement.margin(1),
        ),
      );

  static BoxDecoration get notificationDialogDecoration =>
      blackCornerRound.copyWith(color: AppColors.black400);

  static BoxDecoration get greyCornerRound =>
      blackCornerRoundOP.copyWith(color: AppColors.tabBG);

  static BoxDecoration get primaryCornerRound => greyCornerRound.copyWith(
    color: AppColors.primary,
    borderRadius: BorderRadius.all(Radius.circular(measurement.margin(10))),
  );

  static BoxDecoration get whiteCornerRound =>
      primaryCornerRound.copyWith(color: AppColors.black10);

  static BoxDecoration get tabBg =>
      primaryCornerRound.copyWith(color: AppColors.black24);
}

BoxDecoration dynamicColorDecoration(Color statusColor) {
  return BoxDecoration(
    color: statusColor,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
  );
}
