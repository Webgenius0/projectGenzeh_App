// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/text_font_style.dart';
import '../helpers/ui_helpers.dart';

class CustomCardWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  Color? borderColor;
  void Function()? onTap;
  final Color iconColor;
  final Color iconBorderColor;
  final String iconAssetPath;

  CustomCardWidget({
    Key? key,
    required this.text,
    required this.backgroundColor,
    this.onTap,
    required this.textColor,
    this.borderColor = Colors.transparent,
    required this.iconColor,
    required this.iconBorderColor,
    required this.iconAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 23.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0.r),
          border: Border.all(color: borderColor!, width: 1),
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(16.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0.r),
                border: Border.all(width: 1.0, color: iconBorderColor),
              ),
              child: SvgPicture.asset(
                iconAssetPath,
                color: iconColor,
              ),
            ),
            UIHelper.horizontalSpace(16.h),
            Text(
              text,
              style: TextFontStyle.textStyle16c4D4D4DUrbanistW400.copyWith(
                  color: textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
