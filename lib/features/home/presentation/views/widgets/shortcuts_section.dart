import 'package:auvnet_flutter_assessment/core/utils/app_font_style.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/promotional_banner.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/shortcut_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShortcutsSection extends StatelessWidget {
  const ShortcutsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.sp,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shortcuts:',
          style: AppFontStyle.blackDmSansBold14.copyWith(fontSize: 20.sp),
        ),
        const ShortcutCardListView(),
        const PromotionalBanner(),
      ],
    );
  }
}
