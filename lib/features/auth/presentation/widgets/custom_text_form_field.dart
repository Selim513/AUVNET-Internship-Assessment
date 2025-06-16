import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/core/utils/custom_input_border.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
  });
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: AppFontStyle.textFormMulishFont14,
        hintText: hintText,
        fillColor: AppColors.lightGrayColor.withValues(alpha: 0.2),
        filled: true,
        prefixIconColor: AppColors.blackColor.withValues(alpha: 0.3),
        prefixIcon: Icon(icon),
        border: customOutLineBorders(),
        errorBorder: customOutLineBorders(color: Colors.red),
        enabledBorder: customOutLineBorders(),
        focusedBorder: customOutLineBorders(),
        focusedErrorBorder: customOutLineBorders(color: Colors.red),
      ),
    );
  }
}
