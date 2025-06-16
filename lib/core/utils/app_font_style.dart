import 'package:auvnet_flutter_assessment/core/utils/app_color.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFontStyle {
  static TextStyle rubikFont14 = TextStyle(
    fontSize: 14,
    color: Color(0xff677294),
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle textFormMulishFont14 = TextStyle(
    fontSize: 14,
    color: AppColors.blackColor.withValues(alpha: 0.5),
    fontFamily: GoogleFonts.mulish().fontFamily,
  );
  static TextStyle titleRubikFont28 = TextStyle(
    fontSize: 28,
    color: Color(0xff333333),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle dmSansBold14 = TextStyle(
    fontSize: 14,
    color: AppColors.blueColor,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );
}
