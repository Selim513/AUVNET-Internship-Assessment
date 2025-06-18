import 'package:flutter/material.dart';

class PromotionalBannerImage extends StatelessWidget {
  const PromotionalBannerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(image, fit: BoxFit.fill),
      // Image.asset(ShortcutsSectionImages.mm, fit: BoxFit.fill),
    );
  }
}
