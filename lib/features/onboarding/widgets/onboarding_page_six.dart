import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';

import '../../../../helpers/ui_helpers.dart';

class OnboardingPageSix extends StatefulWidget {
  final String title;
  final String? descriptionOne;
  final String? descriptionTwo;

  const OnboardingPageSix(
      {super.key,
      required this.title,
      this.descriptionOne,
      this.descriptionTwo});

  @override
  State<OnboardingPageSix> createState() => _OnboardingPageSixState();
}

class _OnboardingPageSixState extends State<OnboardingPageSix> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UIHelper.verticalSpace(32.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle24c222222QuandoW400
                  .copyWith(letterSpacing: -0.48.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(72.h),
            SvgPicture.asset(
              Assets.icons.heart,
              height: 80.h,
              width: 80.w,
            ),
            UIHelper.verticalSpace(13.h),
            Text(
              widget.descriptionOne!,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle14c252C2EOpenSansW400
                  .copyWith(color: AppColors.c252C2E, fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(24.h),
            SvgPicture.asset(
              Assets.icons.heart1,
              height: 80.h,
              width: 80.w,
            ),
            UIHelper.verticalSpace(13.h),
            Text(
              widget.descriptionTwo!,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle14c252C2EOpenSansW400
                  .copyWith(color: AppColors.c252C2E, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
