import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/promo_code_content.dart';
import 'package:flutter/material.dart';

class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: Offset(0, 1),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ServicesSectionImages.valut),
          PromoCodeContent(),
        ],
      ),
    );
  }
}
