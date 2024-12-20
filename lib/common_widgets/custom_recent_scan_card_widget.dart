// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomRecentScanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final Color statusIconColor;
  // final String icon;

  const CustomRecentScanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.statusIconColor,
    // required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      height: 106.h,
      decoration: BoxDecoration(
        color: AppColors.cF7F7F7,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 90.w, height: 90.h),
            UIHelper.horizontalSpace(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                      letterSpacing: -0.28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.c212121,
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                                fontSize: 12.sp, color: AppColors.c757575),
                      ),
                      UIHelper.horizontalSpace(8.h),
                      Text(
                        time,
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                                fontSize: 12.sp, color: AppColors.c757575),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.more_vert,
                  size: 16.h,
                ),
                UIHelper.verticalSpace(17.h),
                Text(
                  status,
                  style: TextFontStyle.textStyle14c252C2EOpenSansW400
                      .copyWith(fontSize: 12.sp, color: statusColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
