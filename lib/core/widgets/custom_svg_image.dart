import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getSvg(String svgName,
    {double? height = 20, double? width = 20, Color? color}) {
  return color != null
      ? SvgPicture.asset(
          "assets/images/svg/$svgName.svg",
          height: height,
          width: width,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          allowDrawingOutsideViewBox: true,
        )
      : SvgPicture.asset(
          "assets/images/svg/$svgName.svg",
          height: height,
          width: width,
          allowDrawingOutsideViewBox: true,
        );
}
