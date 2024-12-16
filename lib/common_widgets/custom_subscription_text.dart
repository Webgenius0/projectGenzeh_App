import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

Widget customSubscriptionText({required String text}) {
  return Row(
    children: [
      CircleAvatar(
          backgroundColor: AppColors.c55D0FF,
          radius: 12.r,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              Assets.icons.rightIcon,
              height: 10.h,
              width: 10.w,
            ),
          )),
      UIHelper.horizontalSpace(16.w),
      Text(text,
          style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
              color: AppColors.c222222,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp)),
    ],
  );
}
