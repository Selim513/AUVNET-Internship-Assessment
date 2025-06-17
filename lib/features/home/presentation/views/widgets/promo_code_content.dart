import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';

class PromoCodeContent extends StatelessWidget {
  const PromoCodeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Got a code !',
          style: AppFontStyle.blueDmSansBold14.copyWith(color: Colors.black),
        ),
        Text(
          'Add your code and save on your order',
          style: AppFontStyle.blackDmSansBold12.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
