import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFontStyle {
  static TextStyle rubikFont14 = TextStyle(
    fontSize: 14,
    color: Color(0xff677294),
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
  static TextStyle titleRubikFont28 = TextStyle(
    fontSize: 28,
    color: Color(0xff333333),
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.rubik().fontFamily,
  );
}
