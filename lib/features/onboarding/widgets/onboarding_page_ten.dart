import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/provider/page_view_provider.dart';
import 'package:provider/provider.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../gen/assets.gen.dart';

class OnboardingPageTen extends StatefulWidget {
  final String titleOne;
  final String titleTwo;
  final String description;
  final String? icon;

  const OnboardingPageTen({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.description,
    this.icon,
  });

  @override
  State<OnboardingPageTen> createState() => _OnboardingPageTenState();
}

class _OnboardingPageTenState extends State<OnboardingPageTen> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> signInOption = [
      {
        'icon': Assets.icons.apple,
        'title': 'Continue With Apple',
      },
      {
        'icon': Assets.icons.google,
        'title': 'Continue with Google',
      },
      {
        'icon': Assets.icons.mail,
        'title': 'Continue with Email',
      },
      {
        'icon': null,
        'title': 'I Already Have An Account',
      },
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UIHelper.verticalSpace(85.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.titleOne,
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle24c222222UrbanistW600
                      .copyWith(letterSpacing: -0.5.sp),
                ),
                Text(
                  widget.titleTwo,
                  textAlign: TextAlign.center,
                  style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                      letterSpacing: -0.5.sp, color: AppColors.c0D95F6),
                ),
                UIHelper.horizontalSpace(10.w),
                Text(
                  widget.icon.toString(),
                  style: TextStyle(fontSize: 24.sp),
                ),
              ],
            ),
            UIHelper.verticalSpace(24.h),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle16c4D4D4DOpenSansW400.copyWith(
                color: AppColors.c252C2E,
              ),
            ),
            UIHelper.verticalSpace(56.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(signInOption.length, (index) {
                final option = signInOption[index];
                return CustomButton(
                  text: option['title'],
                  loginIcon: option['icon'],
                  isSelected: selectedIndex == index,
                  onPressed: () {
                    if (index == signInOption.length - 1) {
                      NavigationService.navigateTo(Routes.signInScreen);
                    } else if (index == 2) {
                      context.read<PageViewProvider>().controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                    } else {
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                  },
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
  final String? loginIcon;
  final VoidCallback onPressed;
  final double? width;

  const CustomButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed,
      this.loginIcon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Container(
          height: 56.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.c3689FD,
              width: 1.w,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loginIcon != null)
                SvgPicture.asset(
                  loginIcon!,
                  height: 24.h,
                  width: 24.w,
                ),
              if (loginIcon != null) UIHelper.horizontalSpace(12.w),
              Text(
                text,
                style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
