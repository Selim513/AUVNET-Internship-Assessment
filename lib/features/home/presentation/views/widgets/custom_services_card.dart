import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/custom_card_container.dart';
import 'package:flutter/material.dart';

class CustomServicesCard extends StatelessWidget {
  const CustomServicesCard({
    super.key,
    required this.image,
    required this.title,
    required this.infoTagTitle,
  });
  final String image;
  final String title;
  final String infoTagTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomCardContainer(image: image, color: AppColors.offWhiteColor),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 1),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              infoTagTitle,
              style: AppFontStyle.blackDmSansBold12.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFontStyle.blackDmSansBold12.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
