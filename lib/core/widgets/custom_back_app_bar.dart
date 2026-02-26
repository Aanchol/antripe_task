import 'package:flutter/material.dart';
import '../constants/app_color.dart';
import '../constants/style_constants.dart';
import 'measurement.dart';
import '../navigation/services/navigation_service.dart';

class CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? elevation;
  final bool? centerTitle;
  final bool? backResult;
  final bool isOnlyBack;
  final bool isHome;
  final List<Widget>? action;
  final VoidCallback? backPress;
  @override
  final Size preferredSize;

  const CustomBackAppBar({
    super.key,
    this.title,
    this.isOnlyBack = false,
    this.isHome = false,
    this.elevation,
    this.backPress,
    this.action,
    this.centerTitle,
    this.backResult,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: isOnlyBack ? 0 : elevation ?? measurement.margin(6),
      shadowColor: Colors.grey.withValues(alpha: 0.9),
      centerTitle: centerTitle ?? false,
      toolbarHeight: measurement.margin(65),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(7, 5.0)),
      ),
      titleSpacing: 0.0,
      backgroundColor: AppColors.secondary,
      leading: GestureDetector(
        onTap:
            backPress ??
            () {
              Navigator.pop(context);
              //NavigationService().goBack();
            },
        child: Padding(
          padding: EdgeInsets.all(measurement.margin(14)),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: Text(title!, style: AppTextStyle.largeSemiBoldWhiteTS),
    );
  }
}
