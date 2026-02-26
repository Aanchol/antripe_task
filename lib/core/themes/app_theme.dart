import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_color.dart';
import '../constants/style_constants.dart';

class AppTheme {
  // final AppTheme _theme = AppTheme.primary;
  final ThemeData _themeDark = ThemeData.dark();

  // final ThemeData _primaryThemeData = ThemeData.light();

  ThemeData get theme {
    return _themeDark.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: const MaterialColor(4288120051, {
          30: Color(0xFFF4F4F4),
          50: Color(0xFFC9CCD2),
          100: Color(0xFFB3B3B3),
          200: Color(0xFF868990),
          300: Color(0xFF606268),
          400: Color(0xFF4D4D4D),
          500: Color(0xFF262626),
          // 500: Color(0xFF262626),
          600: Color(0xFF282828),
          700: Color(0xFF1e1e1e),
          800: Color(0xFF1A1A1A),
          900: Color(0xFF12141A),
        }),
        accentColor: Colors.white,
      ),

      // colorScheme: ColorScheme.fromSwatch()
      //     .copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
      // primaryColor: Color(0xFF1A1A1A),
      brightness: Brightness.dark,
      primaryColor: const Color(0xFF1A1A1A),
      primaryColorLight: const Color(0xff9e9e9e),
      primaryColorDark: const Color(0xFF12141A),
      canvasColor: const Color(0xff303030),
      // canvasColor: Colors.red,
      scaffoldBackgroundColor: const Color(0xFF202020),
      cardColor: const Color(0xff424242),
      dividerColor: const Color(0x1fffffff),
      highlightColor: const Color(0x40cccccc),
      splashColor: const Color(0x40cccccc),
      // selectedRowColor: const Color(0xfff5f5f5),
      unselectedWidgetColor: const Color(0xb3ffffff),
      disabledColor: const Color(0x62ffffff),
      secondaryHeaderColor: const Color(0xff616161),
      hintColor: const Color(0xff000000),
      // errorColor: const Color(0xffd32f2f),
      //bottomAppBarColor: const Color(0xff000000),
      bottomAppBarTheme: const BottomAppBarThemeData(color: Color(0xff000000)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff000000),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.secondary,
      ),
      focusColor: AppColors.secondary,
      // scaffoldBackgroundColor: AppColors.white,
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.white,
        unselectedLabelColor: const Color(0x62ffffff),
        indicatorColor: const Color(0x80ffffff),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: const Color(0xFF000000),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.black12;
          }
          return null;
        }),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: const Color(0xFFF4F4F4),
        backgroundColor: AppColors.primary,
        elevation: 3,
        shadowColor: AppColors.black50,
      ),

      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 4.0,
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
        ),
        floatingLabelStyle: AppTextStyle.labelPrimaryTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 4.0,
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 4.0,
          borderSide: BorderSide(color: Colors.primaries[1], width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          gapPadding: 4,
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
        ),
        errorStyle: TextStyle(color: AppColors.redDeep10),
        hintStyle: AppTextStyle.labelTextStyle,
        labelStyle: AppTextStyle.labelTextStyle,
      ),

      textTheme: GoogleFonts.notoSansBengaliTextTheme(),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return const Color(0xffffffff);
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return const Color(0xffffffff);
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return const Color(0xff64ffda);
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return const Color(0xff64ffda);
          }
          return null;
        }),
      ),
      dialogTheme: const DialogThemeData(backgroundColor: Color(0xffffffff)),

      // textTheme: _primaryThemeData.textTheme.apply(fontFamily: 'BalooDa2'),

      // iconTheme: IconThemeData(
      //   color: AppColors.primary,
      // ),
    );
  }

  // ThemeData get theme {
  //   return _themeDark.copyWith(
  //     colorScheme: ColorScheme.fromSwatch()
  //         .copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
  //     primaryColor: AppColors.primary,
  //     progressIndicatorTheme:
  //         ProgressIndicatorThemeData(color: AppColors.primary),
  //     focusColor: AppColors.secondary,
  //     scaffoldBackgroundColor: AppColors.white,
  //     appBarTheme: AppBarTheme(
  //         foregroundColor: AppColors.black900,
  //         backgroundColor: AppColors.white,
  //         elevation: 3,
  //         shadowColor: AppColors.black50),
  //
  //     textSelectionTheme: TextSelectionThemeData(
  //         cursorColor: AppColors.primary,
  //         selectionColor: AppColors.primary,
  //         selectionHandleColor: AppColors.primary),
  //     inputDecorationTheme: InputDecorationTheme(
  //         contentPadding: const EdgeInsets.only(
  //           left: 16,
  //           right: 16,
  //           top: 16,
  //           bottom: 12,
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             gapPadding: 4.0,
  //             borderSide: BorderSide(
  //               color: AppColors.secondary,
  //               width: 1.0,
  //             )),
  //         floatingLabelStyle: AppTextStyle.labelPrimaryTextStyle,
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             gapPadding: 4.0,
  //             borderSide: BorderSide(
  //               color: Colors.black38,
  //               width: 1.0,
  //             )),
  //         disabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             gapPadding: 4.0,
  //             borderSide: BorderSide(
  //               color: Colors.black38,
  //               width: 1.0,
  //             )),
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             gapPadding: 4,
  //             borderSide: BorderSide(color: AppColors.primary, width: 1)),
  //         errorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             borderSide: BorderSide(color: Colors.black38, width: 1)),
  //         focusedErrorBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8),
  //             borderSide: BorderSide(color: AppColors.secondary, width: 1)),
  //         errorStyle: TextStyle(
  //           color: AppColors.red,
  //         ),
  //         hintStyle: AppTextStyle.labelTextStyle,
  //         labelStyle: AppTextStyle.labelTextStyle),
  //
  //     textTheme: GoogleFonts.notoSansBengaliTextTheme(),
  //     // textTheme: _primaryThemeData.textTheme.apply(fontFamily: 'BalooDa2'),
  //
  //     // iconTheme: IconThemeData(
  //     //   color: AppColors.primary,
  //     // ),
  //   );
  // }
}
