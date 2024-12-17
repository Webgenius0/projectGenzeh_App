import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:genzeh911/gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  static final textStyle24c222222QuandoW400 = GoogleFonts.quando(
      color: AppColors.c222222, fontSize: 24.sp, fontWeight: FontWeight.w400);

  static final textStyle16c4D4D4DOpenSansW400 = GoogleFonts.openSans(
      color: AppColors.c4D4D4D, fontSize: 16.sp, fontWeight: FontWeight.w400);

  static final textStylec212121OpenSansW600 = GoogleFonts.openSans(
      color: AppColors.c4D4D4D, fontSize: 14.sp, fontWeight: FontWeight.w600);

  static final textStyle14c252C2EOpenSansW400 = GoogleFonts.openSans(
      color: AppColors.c212121, fontSize: 14.sp, fontWeight: FontWeight.w400);

  static final textStyle24c222222UrbanistW600 = GoogleFonts.urbanist(
      color: AppColors.c252C2E, fontSize: 24.sp, fontWeight: FontWeight.w600);

  static final textStyle24c2B2B2BInterW600 = GoogleFonts.inter(
      color: AppColors.c2B2B2B, fontSize: 24.sp, fontWeight: FontWeight.w600);

  static final textStyle12c0A3004PoppinsW500 = GoogleFonts.poppins(
      color: AppColors.c0A3004, fontSize: 12.sp, fontWeight: FontWeight.w500);

  static final textStyle14c54585CDmSans400 =
      TextStyle(fontFamilyFallback: const [
    'DMSans',
    'Open Sans',
    'Roboto',
    'Noto Sans',
  ], color: AppColors.c54585C, fontSize: 14.sp, fontWeight: FontWeight.w400);
}
