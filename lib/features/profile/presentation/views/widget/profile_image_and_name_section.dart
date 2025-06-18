import 'dart:io';

import 'package:auvnet_flutter_assessment/core/chache/chache_helper.dart';
import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/service_locator/service_locator.dart';
import 'package:auvnet_flutter_assessment/core/utils/image_assets.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/name_section.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/profile_edit_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAndNameSection extends StatefulWidget {
  const ProfileAndNameSection({super.key, required this.name});
  final String? name;

  @override
  State<ProfileAndNameSection> createState() => _ProfileAndNameSectionState();
}

class _ProfileAndNameSectionState extends State<ProfileAndNameSection> {
  String? imagePath;
  @override
  void initState() {
    super.initState();
    imagePath = getIt.get<CacheHelper>().getData(key: LocalCachedKeys.imageKey);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.sp,
      children: [
        CircleAvatar(
          radius: 60.sp,
          backgroundImage: (imagePath != null)
              ? FileImage(File(imagePath!))
              : AssetImage(ImageAssets.profile),
        ),
        NameSection(widget: widget),
        GestureDetector(
          onTap: () {
            showBottomSheet(
              backgroundColor: Colors.white,
              context: context,
              builder: (context) => ProfileEditBottomSheetBody(
                name: widget.name,
                imagePath: imagePath,
              ),
            );
          },
          child: Icon(Icons.mode_edit_outlined, size: 30.sp),
        ),
      ],
    );
  }
}
