import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

import '../../../../helpers/ui_helpers.dart';

class OnboardingPageTwo extends StatefulWidget {
  final String title;

  const OnboardingPageTwo({
    super.key,
    required this.title,
  });

  @override
  State<OnboardingPageTwo> createState() => _OnboardingPageTwoState();
}

class _OnboardingPageTwoState extends State<OnboardingPageTwo> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'Google Search',
      'TikTok',
      'Searched on App Store',
      'Instagram',
      'Facebook',
      'Through a Friend',
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UIHelper.verticalSpace(34.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,

              // client preffered font
              style: TextFontStyle.textStyle24c222222UrbanistW400
                  .copyWith(letterSpacing: -0.48.sp, color: AppColors.c000000),

              // old fonts
              // style: TextFontStyle.textStyle24c222222QuandoW400
              //     .copyWith(letterSpacing: -0.48.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(42.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomButton(
                    text: options[index],
                    isSelected: selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.c3689FD : Colors.transparent,
          border: Border.all(
            color: AppColors.c3689FD,
            width: 1.5.w,
          ),
          borderRadius: BorderRadius.circular(37.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        child: Center(
            child: Text(text,
                style: isSelected
                    ? TextFontStyle.textStyle14c252C2EUrbanistW400.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.cFFFFFF,
                        fontSize: 12.sp,
                      )
                    : TextFontStyle.textStyle14c252C2EUrbanistW400.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.c3689FD,
                        fontSize: 12.sp,
                      ))),
      ),
    );
  }
}
