import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';

class HeaderUserInfoSection extends StatelessWidget {
  const HeaderUserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('Delivering to', style: AppFontStyle.blackDmSansBold14),
        Text(
          'Al Satwa, 81A Street',
          style: AppFontStyle.blackDmSansBold14.copyWith(fontSize: 16),
        ),
        Text('Hi hepa!', style: AppFontStyle.rubikBold30),
      ],
    );
  }
}
