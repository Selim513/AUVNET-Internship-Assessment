import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/custom_card_container.dart';
import 'package:flutter/material.dart';

class ShortcutCard extends StatelessWidget {
  const ShortcutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Constant.shortcutCardItem.map((value) {
        return Expanded(
          child: Column(
            children: [
              CustomCardContainer(
                image: value.image,
                color: AppColors.lightPeachColor,
              ),
              Text(
                value.title,
                textAlign: TextAlign.center,
                style: AppFontStyle.blackDmSansBold12.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
