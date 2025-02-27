import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import '../../../../helpers/ui_helpers.dart';

class OnboardingPageThree extends StatefulWidget {
  final String title;
  final String? description;
  final String? findus;

  const OnboardingPageThree({
    super.key,
    required this.title,
    this.description,
    this.findus,
  });

  @override
  State<OnboardingPageThree> createState() => _OnboardingPageThreeState();
}

class _OnboardingPageThreeState extends State<OnboardingPageThree> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(32.h),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextFontStyle.textStyle24c222222QuandoW400.copyWith(
              letterSpacing: -0.48.sp,
            ),
          ),
          UIHelper.verticalSpace(13.h),
          Text(
            widget.description!,
            textAlign: TextAlign.center,
            style: TextFontStyle.textStyle14c252C2EOpenSansW400
                .copyWith(color: AppColors.c252C2E, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
