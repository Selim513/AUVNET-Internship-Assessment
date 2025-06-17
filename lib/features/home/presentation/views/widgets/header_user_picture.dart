import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:flutter/material.dart';

class HeaderUserPicture extends StatelessWidget {
  const HeaderUserPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(ImageAssets.profile),
        ),
      ],
    );
  }
}
