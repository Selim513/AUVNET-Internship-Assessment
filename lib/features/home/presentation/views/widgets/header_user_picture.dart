import 'dart:io';

import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderUserPicture extends StatefulWidget {
  const HeaderUserPicture({super.key});

  @override
  State<HeaderUserPicture> createState() => _HeaderUserPictureState();
}

class _HeaderUserPictureState extends State<HeaderUserPicture> {
  String? imagePath;
  @override
  //-fetch image
  void initState() {
    super.initState();

    imagePath = getIt.get<CacheHelper>().getData(key: LocalCachedKeys.imageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: (imagePath != null)
              ? FileImage(File(imagePath!))
              : AssetImage(ImageAssets.profile),
        ),
      ],
    );
  }
}
