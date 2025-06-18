import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShortCutsCardContainer extends StatelessWidget {
  const CustomShortCutsCardContainer({
    super.key,
    required this.image,
    required this.color,
  });

  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 65.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(image),
    );
  }
}
