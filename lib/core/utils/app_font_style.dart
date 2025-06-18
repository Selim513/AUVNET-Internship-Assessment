import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFontStyle {
  static TextStyle rubikFont14 = TextStyle(
    fontSize: 14.sp,
    color: const Color(0xff677294),
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle textFormMulishFont14 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor.withValues(alpha: 0.5),
    fontFamily: GoogleFonts.mulish().fontFamily,
  );
  static TextStyle titleRubikFont28 = TextStyle(
    fontSize: 28.sp,
    color: const Color(0xff333333),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle rubikBold30 = TextStyle(
    fontSize: 30.sp,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle blueDmSansBold14 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blueColor,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );
  static TextStyle blackDmSansBold14 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );
  static TextStyle dmSansMeduim12 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );
}
