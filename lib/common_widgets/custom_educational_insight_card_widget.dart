// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomEducationalInsightCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String source;
  final Color backgroundColor;
  void Function()? onTap;

  CustomEducationalInsightCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.source,
    required this.onTap,
    this.backgroundColor = AppColors.cE2F7FF, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: backgroundColor, // Use the dynamic color
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.textStyle12c0A3004PoppinsW500,
                  ),
                  UIHelper.verticalSpace(3.h),
                  Text(
                    'The new Candyman and how horror is',
                    style: TextFontStyle.textStyle12c0A3004PoppinsW500.copyWith(
                        color: AppColors.c757575,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Row(
                    children: [
                      Text(
                        source,
                        style: TextFontStyle.textStyle12c0A3004PoppinsW500
                            .copyWith(
                                fontSize: 9.sp,
                                color: AppColors.cF98121,
                                fontWeight: FontWeight.w300),
                      ),
                      UIHelper.horizontalSpace(7.h),
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.dotIcon,
                            color: AppColors.cC4C4C4,
                          ),
                          UIHelper.horizontalSpace(7.h),
                          Text(
                            time,
                            style: TextFontStyle.textStyle12c0A3004PoppinsW500
                                .copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 9.sp,
                                    color: AppColors.cC4C4C4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              imageUrl,
              width: 77.w,
              height: 77.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
