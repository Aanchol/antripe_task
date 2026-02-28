
import 'package:antripe_task/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/widgets/home_add_contact_form_widget.dart';
import '../constants/app_color.dart';
import '../constants/style_constants.dart';
import 'custom_space.dart';
import 'custom_text.dart';
import 'measurement.dart';

class EmptyContactWidget extends StatelessWidget {
  const EmptyContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: measurement.margin(24)),
        padding: EdgeInsets.symmetric(horizontal:measurement.margin(24), vertical: measurement.margin(32)),
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            customSpace(height: measurement.margin(20)),

            customText(
              text:'Ee! No Contacts\nfound.',
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: AppFontSize.appBarTextSize,
                fontWeight: FontWeight.w600,
                color: AppColors.black850,
                height: 1.4,
              ),
            ),

            customSpace(height: measurement.margin(20)),
            CustomButton(
              height: measurement.margin(56),
              width: measurement.margin(342),
              onTap: (){
                HomeAddContactFormWidget.show(
                  context,
                  onSave: () => Navigator.pop(context),
                  onCancel: () => Navigator.pop(context),
                );
              },
              buttonText: 'Add New Contact',
              buttonTextStyle: AppTextStyle.buttonWhiteTS,
              buttonColor: AppColors.primary,
              borderRadius: measurement.margin(40),
            ),
          ],
        ),
      ),
    );
  }
}