import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopingapi/constant/colors_app.dart';

class AppStyles {
  TextStyle font8(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 8,
    );
  }

  TextStyle font10(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 10,
    );
  }

  TextStyle font12({
    Color color = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w600,
    bool decoration = false,
  }) {
    return GoogleFonts.ibmPlexSansArabic(
        fontWeight: fontWeight,
        color: color,
        fontSize: 12,
        decoration: decoration ? TextDecoration.lineThrough : null,
        decorationColor: decoration ? AppColors.redColor : null);
  }

  TextStyle font13(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 13,
    );
  }

  TextStyle font14(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 14,
    );
  }

  TextStyle font16(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 16,
    );
  }

  TextStyle font18(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 18,
    );
  }

  TextStyle font20(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 20,
    );
  }

  TextStyle font24(
      {Color color = AppColors.blackColor,
      FontWeight fontWeight = FontWeight.w600}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontWeight: fontWeight,
      color: color,
      fontSize: 24,
    );
  }
}
