import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(title, style: AppFontStyle.dmSansBold14),
    );
  }
}
