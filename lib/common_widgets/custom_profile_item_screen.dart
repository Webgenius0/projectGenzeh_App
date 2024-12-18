// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomProfileItemScreen extends StatelessWidget {
  final String rightIconPath;
  final String leftIconPath;
  final String text;
  bool isLogoutText;
  final Function()? onTap;

  CustomProfileItemScreen({
    Key? key,
    required this.leftIconPath,
    required this.rightIconPath,
    required this.text,
    this.isLogoutText = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: Colors.transparent,
      // focusColor: Colors.transparent,
      // hoverColor: Colors.transparent,
      // highlightColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                leftIconPath,
                width: 24.w,
                height: 24.h,
                // Adjust color if necessary
              ),
              UIHelper.horizontalSpace(8.h),
              !isLogoutText
                  ? Text(
                      text,
                      style:
                          TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                        color: AppColors.c0A3004,
                        fontSize: 16.sp,
                        letterSpacing: 0.15.sp,
                      ),
                    )
                  : Text(
                      text,
                      style:
                          TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                        color: AppColors.c0A3004,
                        fontSize: 16.sp,
                        letterSpacing: 0.15.sp,
                      ),
                    ),
              Spacer(),
              SvgPicture.asset(
                rightIconPath,
                width: 24.w,
                height: 24.w,
                // Adjust color if necessary
              )
            ],
          ),
          UIHelper.verticalSpace(5.5.h),
          Divider(
            thickness: 1,
            color: AppColors.c0A3004,
          ),
        ],
      ),
    );
  }
}
