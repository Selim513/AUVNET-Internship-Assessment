import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/models/resturant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularResturantListViewBody extends StatelessWidget {
  const PopularResturantListViewBody({super.key, required this.data});
  final ResturantModel data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(  
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: 70.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.lightGrayColor),
              image: DecorationImage(image: AssetImage(data.image)),
            ),
            child: Image.asset(data.image),
          ),
        ),
        SizedBox(
          width: 80.w,
          child: Text(
            data.title,
            style: AppFontStyle.dmSansMeduim12,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          spacing: 5,
          children: [
            Icon(Icons.access_time_outlined, size: 10.sp),
            Text(
              data.time,
              style: AppFontStyle.dmSansMeduim12.copyWith(
                fontSize: 10.sp,
                color: AppColors.blackColor.withValues(alpha: 0.58),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
