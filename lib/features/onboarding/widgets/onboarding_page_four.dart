import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';

import '../../../../helpers/ui_helpers.dart';

class OnboardingPageFour extends StatefulWidget {
  final String title;
  final String? description;

  const OnboardingPageFour({
    super.key,
    required this.title,
    this.description,
  });

  @override
  State<OnboardingPageFour> createState() => _OnboardingPageFourState();
}

class _OnboardingPageFourState extends State<OnboardingPageFour> {
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
              style: TextFontStyle.textStyle24c222222urbanistW400
                  .copyWith(letterSpacing: -0.48.sp, color: AppColors.c222222),
            ),
            UIHelper.verticalSpace(13.h),
            Text(
              widget.description!,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle14c252C2EUrbanistW400
                  .copyWith(color: AppColors.c252C2E, fontSize: 16.sp),
            ),
            UIHelper.verticalSpace(30.h),
            Image.asset(
              Assets.images.phone.path,
              height: 355.h,
            )
          ],
        ),
      ),
    );
  }
}
