import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';

class CustomSubscriptionButton extends StatelessWidget {
  final String leftText;
  final String rightText1;
  final String rightText2;
  final Color leftTextColor;
  final Color rightTextColor1;
  final Color rightTextColor2;
  final Color containerColor;

  CustomSubscriptionButton({
    required this.leftText,
    required this.rightText1,
    required this.rightText2,
    required this.leftTextColor,
    required this.rightTextColor1,
    required this.rightTextColor2,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextFontStyle.textStyle16c4D4D4DUrbanistW400.copyWith(
              color: leftTextColor,
              fontSize: 14.sp,
            ),
          ),
          Row(
            children: [
              Text(
                rightText1,
                style: TextFontStyle.textStyle14c252C2EUrbanistW400.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    letterSpacing: -0.48.sp,
                    color: rightTextColor1),
              ),
              Text(
                rightText2,
                style: TextFontStyle.textStyle14c252C2EUrbanistW400.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: rightTextColor2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
