import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/provider/page_view_provider.dart';
import 'package:provider/provider.dart';

import '../../../../helpers/ui_helpers.dart';

class OnboardingPageOne extends StatefulWidget {
  final String title;
  final String? description;

  const OnboardingPageOne({
    super.key,
    required this.title,
    this.description,
  });

  @override
  State<OnboardingPageOne> createState() => _OnboardingPageOneState();
}

class _OnboardingPageOneState extends State<OnboardingPageOne> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // UIHelper.verticalSpace(34.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle24c222222QuandoW400
                  .copyWith(letterSpacing: -0.48.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(16.h),
            Text(
              widget.description ?? '',
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle14c252C2EOpenSansW400
                  .copyWith(color: AppColors.c252C2E),
            ),
            UIHelper.verticalSpace(24.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  context.read<PageViewProvider>().options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomButton(
                    text: context.read<PageViewProvider>().options[index],
                    isSelected:
                        context.read<PageViewProvider>().selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        context.read<PageViewProvider>().selectedIndex = index;
                      });
                      print(
                          "Selected option: ${context.read<PageViewProvider>().selectedIndex}");
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
            width: 1.5.r,
          ),
          borderRadius: BorderRadius.circular(37.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Center(
          child: Text(text,
              style: isSelected
                  ? TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.cFFFFFF,
                      fontSize: 12.sp,
                    )
                  : TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.c3689FD,
                      fontSize: 12.sp,
                    )),
        ),
      ),
    );
  }
}
