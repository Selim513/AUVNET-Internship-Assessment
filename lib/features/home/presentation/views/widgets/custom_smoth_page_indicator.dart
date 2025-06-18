import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmothPageIndicator extends StatelessWidget {
  const CustomSmothPageIndicator({super.key, required this.curruntIndex, required this.count});

  final int curruntIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: PageController(initialPage: curruntIndex),
      count: count,
      effect: ScrollingDotsEffect(
        dotWidth: 10,
        dotHeight: 10,
        dotColor: AppColors.lightGrayColor,
        activeDotColor: AppColors.primaryColor,
      ),
    );
  }
}
