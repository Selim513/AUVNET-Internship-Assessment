import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/profile/presentation/views/widget/profile_image_and_name_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameSection extends StatelessWidget {
  const NameSection({super.key, required this.widget});

  final ProfileAndNameSection widget;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        widget.name ?? '',
        maxLines: 2,
        overflow: TextOverflow.clip,

        style: AppFontStyle.titleRubikFont28.copyWith(
          color: AppColors.primaryColor,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
