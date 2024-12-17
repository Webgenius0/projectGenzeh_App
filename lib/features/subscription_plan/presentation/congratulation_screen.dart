import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_subscription_text.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/presentation/home_screen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:get/get.dart';

class CongratulationScreen extends StatefulWidget {
  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              Assets.icons.arrowBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            Assets.images.splashScreen.path,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(82.h),
                SvgPicture.asset(Assets.icons.congratulation),
                UIHelper.verticalSpace(12.h),
                Text(
                  'Congratulations!',
                  style: TextFontStyle.textStyle24c2B2B2BInterW600
                      .copyWith(letterSpacing: -0.48.sp),
                ),
                UIHelper.verticalSpace(12.h),
                Text(
                  'You’ve Unlocked Your Subscription',
                  style: TextFontStyle.textStyle24c2B2B2BInterW600.copyWith(
                    color: AppColors.c2B2B2B,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                UIHelper.verticalSpace(14.h),
                Divider(
                  color: Colors.black,
                  thickness: .7,
                ),
                UIHelper.verticalSpace(56.h),
                Text(
                  'Benefits Unlocked:',
                  style: TextFontStyle.textStyle24c2B2B2BInterW600.copyWith(
                      color: AppColors.c2B2B2B,
                      fontSize: 18.sp,
                      letterSpacing: -0.36.sp),
                ),
                UIHelper.verticalSpace(16.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: customSubscriptionText(
                      text: 'AI-Powered Analysis and Risk Assessments.'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: customSubscriptionText(
                      text: 'Scientific Based Educational Insights'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: customSubscriptionText(
                      text: 'Self Empowerment to a Healthier You'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: customSubscriptionText(text: 'AD Free'),
                ),
                UIHelper.horizontalSpace(32.w),
                Divider(color: AppColors.c2B2B2B.withOpacity(0.2)),
                UIHelper.verticalSpace(24.h),
                Text(
                  textAlign: TextAlign.center,
                  'Congratulations your subscription will renew in the time interval chosen, unless cancelled. Subscription is managed in your account settings,',
                  style: TextFontStyle.textStyle24c2B2B2BInterW600.copyWith(
                    color: AppColors.c2B2B2B,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    height: 1.6,
                  ),
                ),
                UIHelper.verticalSpace(53.w),
                customElevatedButton(
                    onPressed: () {
                      Get.to(() => HomeScreen());
                    },
                    child: Text(
                      'Start Exploring Premium Features',
                      style: TextFontStyle.textStyle24c2B2B2BInterW600.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.cFFFFFF,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    bgColor: AppColors.allPrimaryColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
