import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class AppFontSize {
  static double get tooSmallTextSize => 10;

  static double get smallTextSize => 12;

  static double get mediumTextSize => 14;

  static double get largeTextSize => 16;

  static double get appBarTextSize => 18;

  static double get semiLargeTextSize => 20;

  static double get extraLargeTextSize => 24;

  static double get xxLargeTextSize => 28;
}

class AppTextStyle {
  static TextStyle get appBarTextStyleWhite => TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: AppFontSize.mediumTextSize,
    color: AppColors.white,
  );

  static TextStyle get largeBlackTextStyle => appBarTextStyleWhite.copyWith(
    fontWeight: FontWeight.w500,
    color: AppColors.black700,
    fontSize: AppFontSize.smallTextSize,
  );

  static TextStyle get mediumWhiteTS =>
      mediumBlackTS.copyWith(color: AppColors.white);

  static TextStyle get mediumBlackTS => GoogleFonts.aBeeZee(
    color: Colors.white70,
    fontWeight: FontWeight.w500,
    fontSize: AppFontSize.mediumTextSize,
  );
  static TextStyle get buttonWhiteTS => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: AppFontSize.largeTextSize,
    letterSpacing: 0.5,
    color: AppColors.white
  );
  static TextStyle get buttonBlackTS => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: AppFontSize.largeTextSize,
    letterSpacing: 0.5,
    color: AppColors.black
  );
  static TextStyle get dropDownBlackTS => TextStyle(
    color:  AppColors.black900,
    fontSize:AppFontSize.largeTextSize ,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get largeBlackTS => GoogleFonts.robotoSlab(
    color: AppColors.black800,
    fontSize: AppFontSize.largeTextSize,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get semiLargeBlackTS =>
      largeBlackTS.copyWith(fontSize: AppFontSize.semiLargeTextSize);

  static TextStyle get largeSemiBoldWhiteTS => largeBlackTS.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get largeBoldWhiteTS => largeBlackTS.copyWith(
    color: AppColors.white,
    fontWeight: FontWeight.w700,
    fontSize: AppFontSize.semiLargeTextSize,
  );

  static TextStyle get largeSemiBoldBlackTS =>
      largeSemiBoldWhiteTS.copyWith(color: AppColors.black);

  static TextStyle get labelTextStyle => TextStyle(
    //color: AppColors.white,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: AppFontSize.smallTextSize,
  );

  static TextStyle get labelPrimaryTextStyle => labelTextStyle.copyWith(
    color: AppColors.black,
    // color: AppColors.primary
  );
}
