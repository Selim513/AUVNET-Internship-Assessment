import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:flutter/material.dart';

class IntroTextSection extends StatelessWidget {
  const IntroTextSection({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppFontStyle.titleRubikFont28),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppFontStyle.rubikFont14,
        ),
      ],
    );
  }
}
