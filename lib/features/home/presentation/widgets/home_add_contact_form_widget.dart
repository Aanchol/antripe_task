import 'package:flutter/material.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/style_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_space.dart';
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
      builder: (_) => HomeAddContactFormWidget(
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
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController designationController;
  late final TextEditingController companyController;

  String selectedRelation = "Family";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    designationController = TextEditingController();
    companyController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    designationController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
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
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                customSpace(height: measurement.margin(24)),

                /// NAME FIELD
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: CustomTextField(
                    textEditingController: nameController,
                    labelText: 'Name',
                    hintText: 'John Smith',
                    isObscure: false,
                    readOnly: false,
                  ),
                ),

                customSpace(height: measurement.margin(16)),

                /// PHONE FIELD (Custom UI)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(14),
                      vertical: measurement.margin(6),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                         customText(text:"🇺🇸", textStyle: TextStyle(fontSize: 20)),
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 20),
                        SizedBox(width: measurement.margin(8)),

                        customText(
                          text:"+880",
                          textStyle: TextStyle(
                              fontSize: AppFontSize.largeTextSize, fontWeight: FontWeight.w500),
                        ),

                        SizedBox(width: measurement.margin(12)),

                        Expanded(
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: "01812 432 654",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                customSpace(height: measurement.margin(16)),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: CustomTextField(
                    textEditingController: designationController,
                    labelText: 'Designation',
                    hintText: 'Doctor',
                    isObscure: false,
                    readOnly: false,
                  ),
                ),

                customSpace(height: measurement.margin(16)),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: CustomTextField(
                    textEditingController: companyController,
                    labelText: 'Company',
                    hintText: 'ABC Ltd.',
                    hintTextStyle: TextStyle(color: AppColors.grey),
                    isObscure: false,
                    readOnly: false,
                  ),
                ),

                customSpace(height: measurement.margin(16)),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedRelation,
                    decoration: InputDecoration(
                      labelText: "Relation",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: Colors.grey.shade200, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 2),
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Family',
                        child: Text("Family"),
                      ),
                      DropdownMenuItem(
                        value: 'Friends',
                        child: Text("Friends"),
                      ),
                      DropdownMenuItem(
                        value: 'Work',
                        child: Text("Work"),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => selectedRelation = value);
                      }
                    },
                  ),
                ),

                customSpace(height: measurement.margin(24)),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: CustomButton(
                    height: measurement.margin(56),
                    onTap: widget.onSave ?? () => Navigator.pop(context),
                    buttonText: 'Save Contact',
                    buttonTextStyle: AppTextStyle.buttonWhiteTS,
                    buttonColor: AppColors.primary,
                    borderRadius: measurement.margin(40),
                  ),
                ),

                customSpace(height: measurement.margin(16)),

                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: measurement.margin(24)),
                  child: CustomButton(
                    height: measurement.margin(56),
                    onTap: widget.onCancel ?? () => Navigator.pop(context),
                    buttonText: 'Cancel',
                    buttonColor: AppColors.white,
                    borderRadius: measurement.margin(40),
                    buttonTextStyle: AppTextStyle.buttonBlackTS,
                    borderColor: AppColors.black,
                  ),
                ),

                customSpace(height: measurement.margin(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}