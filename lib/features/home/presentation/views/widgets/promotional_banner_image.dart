import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PromotionalBannerImage extends StatelessWidget {
  const PromotionalBannerImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => const Icon(Icons.error),
        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) =>
            const Center(child: CircularProgressIndicator()),
      ),

      // Image.asset(ShortcutsSectionImages.mm, fit: BoxFit.fill),
    );
  }
}
