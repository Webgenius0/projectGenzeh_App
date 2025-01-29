import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_subscription_plan_button.dart';
import 'package:genzeh911/common_widgets/custom_subscription_text.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            UIHelper.verticalSpace(16.h),
            Text(
              'Subscription Plans',
              style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                  color: AppColors.c2B2B2B,
                  fontSize: 20.sp,
                  letterSpacing: -0.4.sp,
                  fontWeight: FontWeight.w600),
            ),
            UIHelper.verticalSpace(16.h),
            Container(
              width: 342.w,
              height: 125.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  image: DecorationImage(
                      image: AssetImage(
                        Assets.images.img1.path,
                      ),
                      fit: BoxFit.cover)),
            ),
            UIHelper.verticalSpace(16.h),
            Text(
              'Uncover the Truth Behind Your Products-Scan for a Safer Future!',
              style: TextFontStyle.textStyle24c222222UrbanistW600
                  .copyWith(color: AppColors.c000000, letterSpacing: -0.5.sp),
            ),
            UIHelper.verticalSpace(16.h),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: customSubscriptionText(
                  text: 'Al Agent Managed Risk Assessments.'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: customSubscriptionText(
                  text: 'Scientific Based Educational Insights.'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: customSubscriptionText(
                  text: 'Self Empowerment to a Healthier You.'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: customSubscriptionText(text: 'AD Free'),
            ),
            UIHelper.verticalSpace(10.w),
            CustomSubscriptionButton(
              containerColor: AppColors.c3689FD,
              leftText: 'Weekly Plan',
              leftTextColor: Colors.white,
              rightText1: '3.75',
              rightText2: ' /Weekly',
              rightTextColor1: Colors.white,
              rightTextColor2: AppColors.c222222.withOpacity(0.72),
            ),
            UIHelper.verticalSpace(10.w),
            CustomSubscriptionButton(
              containerColor: AppColors.cF8F8F8,
              leftText: 'Monthly Plan',
              leftTextColor: Colors.black,
              rightText1: '7.50',
              rightText2: ' /Monthly',
              rightTextColor1: AppColors.c222222,
              rightTextColor2: AppColors.c222222.withOpacity(0.72),
            ),
            UIHelper.verticalSpace(10.w),
            CustomSubscriptionButton(
              containerColor: AppColors.cF8F8F8,
              leftText: 'Annual Plan',
              leftTextColor: Colors.black,
              rightText1: '32.25',
              rightText2: ' /Annual',
              rightTextColor1: AppColors.c222222,
              rightTextColor2: AppColors.c222222.withOpacity(0.72),
            ),
            UIHelper.verticalSpace(10.h),
            customElevatedButton(
                onPressed: () {
                  NavigationService.navigateTo(Routes.processPaymentScreen);
                },
                child: Text(
                  'Continue',
                  style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    fontSize: 16.sp,
                    color: AppColors.cFFFFFF,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                bgColor: AppColors.allPrimaryColor),
          ],
        ),
      )),
    );
  }
}
