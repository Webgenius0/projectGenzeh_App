// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomAccountWidget extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final String text;
  final void Function()? onTap;
  final bool showDivider;

  const CustomAccountWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.onTap,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.c55D0FF.withOpacity(0.16),
                    ),
                    child: SvgPicture.asset(
                      icon,
                      color: iconColor,
                    )),
                UIHelper.horizontalSpace(16.w), // Horizontal spacing
                Text(text,
                    style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                        fontSize: 16.sp,
                        letterSpacing: -0.32.sp,
                        color: AppColors.c212121)),

                Spacer(),
                SvgPicture.asset(
                  Assets.icons.arrowRightTwo,
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            UIHelper.verticalSpace(10.h),
            if (showDivider)
              Divider(
                thickness: 1,
                color: AppColors.cEBEBEB,
              ),
          ],
        ),
      ),
    );
  }
}
