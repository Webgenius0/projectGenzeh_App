import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_account_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class AccountFullScreen extends StatefulWidget {
  const AccountFullScreen({Key? key}) : super(key: key);

  @override
  _AccountFullScreenState createState() => _AccountFullScreenState();
}

class _AccountFullScreenState extends State<AccountFullScreen> {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Assets.icons.notification, // Replace with your asset path
      'text': 'Personal Info',
      'iconColor': Colors.blue,
      // 'route': PersonalInfoScreen(),
      // Replace with your actual screen.
    },
    // {
    //   'icon': Assets.icons.notification, // Replace with your asset path
    //   'text': 'Notification',
    //   'iconColor': Colors.blue,
    //   'route': NotificationScreeen(),
    //   // Replace with your actual screen.
    // },
    {
      'icon': Assets.icons.helpCenter, // Replace with your asset path
      'text': 'Help Center',
      'iconColor': Colors.blue,
      // 'route': FaqScreen(),
      // Replace with your actual screen.
    },
    {
      'icon': Assets.icons.aboutUs, // Replace with your asset path
      'text': 'About Us',
      'iconColor': Colors.blue,
      // 'route': FaqScreen(),
      // Replace with your actual screen.
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.cF4F5F6,
        appBar: AppBar(
          backgroundColor: AppColors.cF4F5F6,
          leading: IconButton(
            onPressed: () {
              // Get.back();
            },
            icon: SvgPicture.asset(
              Assets.icons.logos,
              width: 58.w,
              height: 58.h,
              fit: BoxFit.contain,
            ),
          ),
          centerTitle: true,
          title: Text('Account',
              style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                  fontSize: 20.sp,
                  letterSpacing: -0.4,
                  color: AppColors.c2B2B2B)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              UIHelper.verticalSpace(24.h),
              GestureDetector(
                onTap: () =>
                    NavigationService.navigateTo(Routes.personalInfoScreen),
                child: Container(
                  height: 90.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.cFFFFFF,
                  ),
                  child: Row(
                    children: [
                      Image.asset(Assets.images.person.path),
                      UIHelper.horizontalSpace(12.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Andrew Ainsley',
                              style: TextFontStyle.textStylec212121OpenSansW600
                                  .copyWith(
                                      fontSize: 16.sp,
                                      letterSpacing: -0.32.sp,
                                      color: AppColors.c212121)),
                          UIHelper.verticalSpace(8.h),
                          Text('andrew.ainsley@mail.com',
                              style: TextFontStyle
                                  .textStyle24c222222UrbanistW600
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: AppColors.c545A63)),
                          UIHelper.verticalSpace(8.h),
                        ],
                      ),
                      UIHelper.horizontalSpace(12.w),
                      Spacer(),
                      SvgPicture.asset(
                        Assets.icons.profileEdit,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.contain,
                      )
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.cFFFFFF,
                ),
                child: ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isLastItem = index == items.length - 1;
                    return Column(
                      children: [
                        UIHelper.verticalSpace(16.h),
                        CustomAccountWidget(
                          icon: item['icon'],
                          iconColor: item['iconColor'],
                          text: item['text'],
                          onTap: () {
                            if (index == 0) {
                              NavigationService.navigateTo(
                                  Routes.personalInfoScreen);
                            } else if (index == 1) {
                              NavigationService.navigateTo(Routes.faqScreen);
                            } else if (index == 2) {
                              // NavigationService.navigateTo(Routes.faqScreen);
                            }
                          },
                          showDivider: !isLastItem,
                        ),
                        if (isLastItem) UIHelper.verticalSpace(10.h),
                      ],
                    );
                  },
                ),
              ),
              UIHelper.verticalSpace(10.h),
              GestureDetector(
                onTap: () => NavigationService.navigateTo(Routes.signInScreen),
                child: Container(
                  height: 72.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.cFFFFFF,
                  ),
                  child: Row(
                    children: [
                      Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.r),
                            color: Colors.red.withOpacity(0.11),
                          ),
                          child: SvgPicture.asset(
                            Assets.icons.logout,
                          )),
                      UIHelper.horizontalSpace(16.w), // Horizontal spacing
                      Text('Log Out',
                          style: TextFontStyle.textStyle24c222222UrbanistW600
                              .copyWith(
                                  fontSize: 14.sp, color: AppColors.cFF0000)),
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(24.h),
            ],
          ),
        ));
  }
}
