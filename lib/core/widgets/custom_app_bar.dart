import 'package:flutter/material.dart';
import '../constants/decoration_constants.dart';
import '../constants/style_constants.dart';
import '../navigation/route_paths.dart';
import '../navigation/services/navigation_service.dart';
import 'custom_text.dart';
import 'measurement.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            NavigationService().navigateTo(RoutePaths.profile);
          },
          child: Padding(
            padding: EdgeInsets.all(measurement.margin(16)),
            child: Container(
              decoration: AppDecorations.profileRoundCorner,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage(
                  "assets/images/png/profile_avatar.png",
                ),
                radius: measurement.margin(15),
              ),
            ),
          ),
        ),
        customText(
          text: 'Dashboard',
          textStyle: AppTextStyle.largeSemiBoldBlackTS,
        ),
        // InkWell(
        //     onTap: (){
        //
        //     },
        //     child: Icon(Icons.menu_outlined)
        // )
      ],
    );
  }
}
