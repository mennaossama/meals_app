import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/styles/app_colors.dart';

class TextStyles {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
      fontSize: 32.sp, fontWeight: FontWeight.w700, color: AppColors.white);
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(
      fontSize: 13.sp, fontWeight: FontWeight.normal, color: AppColors.white);

  static TextStyle white14SemiBold = GoogleFonts.inter(
      fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.white);
  static TextStyle black16Medium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle grey14Regular = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff878787),
  );
}
