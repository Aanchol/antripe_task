import 'package:antripe_task/core/widgets/custom_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/style_constants.dart';
import '../../../../core/navigation/services/navigation_service.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/measurement.dart';


class HomeAddContactFormWidget extends StatefulWidget {
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const HomeAddContactFormWidget({
    super.key,
    this.onSave,
    this.onCancel,
  });

  static void show(
      BuildContext context, {
        VoidCallback? onSave,
        VoidCallback? onCancel,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => HomeAddContactFormWidget(
        onSave: onSave,
        onCancel: onCancel,
      ),
    );
  }

  @override
  State<HomeAddContactFormWidget> createState() =>
      _HomeAddContactFormWidgetState();
}

class _HomeAddContactFormWidgetState extends State<HomeAddContactFormWidget> {
  //late TextEditingController dateController;
  late TextEditingController nameController;
  late TextEditingController designationController;
  late TextEditingController companyController;
  String selectedCategory = 'family';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    designationController = TextEditingController();
    companyController = TextEditingController();
  }

  @override
  void dispose() {
    //dateController.dispose();
    nameController.dispose();
    designationController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: EdgeInsets.only(top: measurement.margin(12)),
              width: measurement.margin(40),
              height: measurement.margin(4),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // // Date Field
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
            //   child: InkWell(
            //     onTap: () async {
            //       // Handle date picker here
            //     },
            //     child: AbsorbPointer(
            //       child: CustomTextField(
            //         textEditingController: dateController,
            //         labelText: 'Date',
            //         hintText: 'DD/MM/YYYY',
            //         prefixIcon: Padding(
            //           padding: EdgeInsets.all(measurement.margin(8)),
            //           child: Icon(Icons.event, color: AppColors.secondary),
            //         ),
            //         suffixIcon: const Icon(Icons.arrow_drop_down), isObscure: false, readOnly: false,
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(height: measurement.margin(16)),

            // Name Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: CustomTextField(
                textEditingController: nameController,
                labelText: 'Name',
                hintText: 'John Smith', isObscure: false, readOnly: false,
              ),
            ),

            customSpace(height: measurement.margin(16)),

            // Designation Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: CustomTextField(
                textEditingController: designationController,
                labelText: 'Designation',
                hintText: 'Doctor', isObscure: false, readOnly: false,
              ),
            ),

            customSpace(height: measurement.margin(16)),

            // Company Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: CustomTextField(
                textEditingController: companyController,
                labelText: 'Company',
                hintText: 'ABC Ltd.', isObscure: false, readOnly: false,
              ),
            ),

            customSpace(height: measurement.margin(16)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: DropdownButtonFormField<String>(
                  initialValue: selectedCategory,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyLight),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyLight, width: 2),
                    ),
                   // contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'family', child: Text('Family')),
                    DropdownMenuItem(value: 'friends', child: Text('Friends')),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => selectedCategory = value);
                  },
                ),
              ),
            ),

            customSpace(height: measurement.margin(16)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: CustomButton(
                height: measurement.margin(56),
                width: measurement.margin(342),
                onTap: widget.onSave ?? () => Navigator.pop(context),
                buttonText: 'Save Contact',
                buttonTextStyle: AppTextStyle.buttonWhiteTS,
                buttonColor: AppColors.primary,
                borderRadius: measurement.margin(40),
              ),
            ),

            customSpace(height: measurement.margin(16)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: measurement.margin(24)),
              child: CustomButton(
                height: measurement.margin(56),
                width: measurement.margin(342),
                onTap: widget.onCancel ?? () => Navigator.pop(context),
                buttonText: 'Cancel',
                buttonColor: AppColors.white,
                borderRadius: measurement.margin(40),
                buttonTextStyle: AppTextStyle.buttonBlackTS,
                borderColor: AppColors.black,
              ),
            ),

            customSpace(height: measurement.margin(16)),
          ],
        ),
      ),
    );
  }
}
