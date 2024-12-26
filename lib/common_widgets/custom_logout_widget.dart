import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomLogoutWidget extends StatelessWidget {
  CustomLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 214.h,
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      decoration: BoxDecoration(
          color: AppColors.cFFFFFF,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(31.h),
          Text(
            'Log Out',
            style: TextFontStyle.textStyle14c54585CDmSans400.copyWith(
                fontSize: 18.sp,
                color: AppColors.c000000,
                letterSpacing: 0.5.sp),
          ),
          UIHelper.verticalSpace(15.h),
          Divider(
            color: AppColors.c0A3004,
            thickness: 1.sp,
          ),
          UIHelper.verticalSpace(15.h),
          Text('Are You Sure you Want to log out',
              style: TextFontStyle.textStyle14c54585CDmSans400.copyWith(
                  fontSize: 16.sp,
                  letterSpacing: 0.15,
                  color: AppColors.c0A3004)),
          UIHelper.verticalSpace(15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CustomButton(
              //   name: 'Cancel',
              //   bgColor: Colors.transparent,
              //   textStyle: TextFontStyle.textStyle14c54585CDmSans400.copyWith(
              //       fontSize: 16.sp, color: AppColors.allPrimaryColor),
              //   callback: () {
              //     print('Login functionality will be implement here.');
              //     NavigationService.goBack;
              //   },
              //   textColor: AppColors.allPrimaryColor,
              //   borderColor: AppColors.allPrimaryColor,
              // ),
              // UIHelper.horizontalSpace(15.w),
              // CustomButton(
              //     name: 'Yes, Log out',
              //     bgColor: AppColors.allPrimaryColor,
              //     callback: () {
              //       print('Login functionality will be implement here.');
              //     },
              //     textStyle: TextFontStyle.textStyle14c5A5C5FPoppinsW400
              //         .copyWith(fontSize: 16.sp, color: AppColors.cFFFFFF),
              //     textColor: Colors.transparent),
            ],
          ),
          UIHelper.verticalSpace(15.h),
        ],
      ),
    );
  }
}
