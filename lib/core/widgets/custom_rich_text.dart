import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    required this.firstText,
    required this.secondText,
    required this.firstStyle,
    required this.secondStyle,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final String firstText, secondText;
  final TextStyle firstStyle, secondStyle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: firstStyle,
          children: <TextSpan>[
            TextSpan(
              text: secondText,
              style: secondStyle,
            ),
          ],
        ),
      ),
    );
  }
}
