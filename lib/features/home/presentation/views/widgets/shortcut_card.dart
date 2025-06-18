import 'package:auvnet_flutter_assessment/core/constant.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/custom_card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ShortcutCardListView extends StatelessWidget {
  const ShortcutCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.sp,
      child: ListView.separated(
        separatorBuilder: (context, index) => Gap(8.sp),
        scrollDirection: Axis.horizontal,
        itemCount: Constant.shortcutCardItem.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CustomShortCutsCardContainer(
                image: Constant.shortcutCardItem[index].image,
                color: AppColors.lightPeachColor,
              ),
              SizedBox(
                width: 65.w,
                child: Text(
                  Constant.shortcutCardItem[index].title,
                  textAlign: TextAlign.center,

                  style: AppFontStyle.dmSansMeduim12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
