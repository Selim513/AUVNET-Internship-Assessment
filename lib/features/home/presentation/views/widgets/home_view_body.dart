import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/home_view_content.dart';
import 'package:auvnet_flutter_assessment/features/home/presentation/views/widgets/home_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [const HomeViewHeader(), Gap(6.sp), const HomeViewContent()],
      ),
    );
  }
}
