import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levado/core/Utils/colors.dart';

abstract class Styles {
  static TextStyle textStyle15 = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColor.textSecondaryColor
  );
  static TextStyle textStyle16 = GoogleFonts.fjordOne(
    fontSize: 16,
      color: AppColor.textSecondaryColor
  );
  static TextStyle textStyle25 = GoogleFonts.fjordOne(
    fontSize: 25,
    fontWeight: FontWeight.normal,
      color: AppColor.textSecondaryColor
  );
  static TextStyle textStyle40 = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w900,
      color: AppColor.textBodyColor
  );

  static TextStyle textStyle90 = GoogleFonts.inter(
      fontSize: 50,
      fontWeight: FontWeight.w300,
      color: AppColor.textBodyColor
  );

  static TextStyle textStyle30 = GoogleFonts.inter(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: AppColor.textSecondaryColor
  );
  static TextStyle textStyle17 = GoogleFonts.gabriela(
    fontSize: 17,
    fontWeight: FontWeight.w400,
      color: AppColor.textSecondaryColor
  );


  static TextStyle textStyle20 = GoogleFonts.gabriela(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColor.textSecondaryColor
  );
}

const TextStyle textStyle = TextStyle();
