import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/promo_code_card.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/services_item_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServicesSectionBody extends StatelessWidget {
  const ServicesSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 14,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services:',
          style: AppFontStyle.blackDmSansBold12.copyWith(fontSize: 20),
        ),
        Gap(5),
        ServicesCategory(),
        PromoCodeCard(),
      ],
    );
  }
}
