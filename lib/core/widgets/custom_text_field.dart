import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/style_constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.textEditingController,
    required this.hintText,
    this.labelText,
    this.prefix,
    required this.isObscure,
    this.onChange,
    this.validate,
    this.hintTextStyle,
    this.labelTextStyle,
    this.fillColor,
    this.prefixText,
    this.autoFocus,
    this.suffixIcon,
    this.errorText,
    this.keyboardType,
    this.prefixIcon,
    this.initValue,
    this.onSuffixTap,
    required this.readOnly,
    //this.controller,
    this.maxLength = 500,
    this.borderColor,
    super.key,
  });
  final TextEditingController? textEditingController;
  final String hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final bool isObscure;
  final Color? fillColor;
  final bool? autoFocus;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final ValueChanged<String>? onChange;
  final String? Function(String? val)? validate;
  final int maxLength;
  final String? initValue;
  final bool readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixTap;

  //final TextEditingController? controller;
  final OutlineInputBorder? borderColor;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShow = true;

  @override
  void initState() {
    super.initState();

    // Listen for changes in the controller and update the initValue
    widget.textEditingController?.addListener(() {
      if (widget.textEditingController != null) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isObscure
        ? TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            readOnly: widget.readOnly,
            initialValue: widget.initValue,
            validator: widget.validate,
            onChanged: widget.onChange,
            controller: widget.textEditingController,
            obscureText: isShow,
            textDirection: TextDirection.ltr,
            style: AppTextStyle.labelTextStyle,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
              errorText: widget.errorText,
              fillColor: widget.fillColor ?? Colors.transparent,
              filled: true,
              prefixIconConstraints: const BoxConstraints(maxWidth: 40),
              enabledBorder:
                  widget.borderColor ??
                  OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
              border: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
              disabledBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(8),
                gapPadding: 4.0,
                borderSide: BorderSide(color: Colors.primaries[1], width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.secondary, width: 2),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                child: isShow
                    ? Icon(Icons.visibility_off, color: AppColors.black400)
                    : Icon(Icons.visibility, color: AppColors.black400),
              ),

              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(8), gapPadding: 4.0),
              // contentPadding:
              //     EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
            ),
          )
        : TextFormField(
            readOnly: widget.readOnly,
            initialValue: widget.initValue,
            validator: widget.validate,
            onChanged: widget.onChange,
            controller: widget.textEditingController,
            obscureText: false,
            autofocus: widget.autoFocus ?? false,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            style: AppTextStyle.labelTextStyle,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },

            //textAlign: TextAlign.center,
            decoration: InputDecoration(
              errorText: widget.errorText,

              // errorStyle: AppTextStyle.thinSmallRedTS,
              prefixText: widget.prefixText,
              prefixStyle: AppTextStyle.largeBlackTextStyle,
              hintText: widget.hintText,
              labelText: widget.labelText,
              counter: const Offstage(),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              prefix: widget.prefix,
              fillColor: widget.fillColor ?? Colors.transparent,
              filled: true,
              prefixIconConstraints: const BoxConstraints(maxWidth: 40),
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(8), gapPadding: 4.0),
              enabledBorder:
                  widget.borderColor ??
                  OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
              border: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                //borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.secondary, width: 2),
              ),
            ),
          );
  }
}
