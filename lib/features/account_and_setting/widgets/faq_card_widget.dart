// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class FaqCardWidget extends StatefulWidget {
  final String collapsedTitle;
  final String subtitle;

  const FaqCardWidget({
    Key? key,
    required this.collapsedTitle,
    required this.subtitle,
  }) : super(key: key);

  @override
  _FaqCardWidgetState createState() => _FaqCardWidgetState();
}

class _FaqCardWidgetState extends State<FaqCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 18.0.h, vertical: 18.w),
        decoration: BoxDecoration(
          color: AppColors.cFAFAFA,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Always show collapsed title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.collapsedTitle,
                  style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                      fontSize: 16.sp,
                      letterSpacing: -0.32,
                      color: AppColors.c2B2B2B),
                ),
                SvgPicture.asset(
                  isExpanded ? Assets.icons.arrowBottom : Assets.icons.arrowUp,
                  height: 16.sp,
                  width: 16.w,
                  color: AppColors.c000000,
                ),
              ],
            ),

            if (isExpanded) ...[
              Divider(color: AppColors.cE7E7E7, height: 8.h),
              UIHelper.verticalSpace(8.h),
              Text(
                widget.subtitle,
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.c2B2B2B.withOpacity(0.7),
                    fontWeight: FontWeight.w500),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
