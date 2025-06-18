import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/popular_resturant_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularResturantSection extends StatelessWidget {
  const PopularResturantSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular restaurants nearby',
          style: AppFontStyle.blackDmSansBold14.copyWith(fontSize: 16.sp),
        ),
        const PopularResturantListView(),
      ],
    );
  }
}
