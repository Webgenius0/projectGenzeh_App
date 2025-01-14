// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  final List<Map<String, dynamic>> educationalInsightDataList = [
    {
      "imageUrl": Assets.images.fruits.path,
      "title": "Food price rise fears amid staff shortages",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.winter.path,
      "title": "2021's most brilliant horror movie",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "icon": Assets.icons.dotIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 280.h,
          decoration: BoxDecoration(
            color: AppColors.c4A80E1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Column(
              children: [
                UIHelper.verticalSpace(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Assets.images.profile.path,
                          height: 40.h,
                          width: 40.w,
                        ),
                        UIHelper.horizontalSpace(12.w),
                        Text(
                          "Welcome Back,\nSaklain",
                          style: TextFontStyle.textStyle16cffffffOpenSansW600,
                        ),
                      ],
                    ),
                    // SvgPicture.asset(
                    //   Assets.icons.notification,
                    //   color: AppColors.cffffff,
                    // ),
                    InkWell(
                      // onTap: () {
                      //   NavigationService.navigateTo(
                      //       Routes.notificationScreeen);
                      // },
                      child: Container(
                        width: 40, // Width of the circular container
                        height: 40, // Height of the circular container
                        decoration: BoxDecoration(
                          color: AppColors.cC5EAFF4D.withOpacity(
                              .3), // Background color of the circle
                          shape:
                              BoxShape.circle, // Makes the container circular
                        ),
                        child: Icon(
                          Icons.notifications_none, // Notification bell icon
                          color: Colors.white, // Icon color
                          size: 20, // Icon size
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Scans",
                      style: TextFontStyle.textStyle14c252C2EOpenSansW400
                          .copyWith(
                              color: AppColors.cffffff,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.36),
                    ),
                    GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                              Routes.bottomNav, {"pageNum": 2});
                        },
                        child: SvgPicture.asset(
                          Assets.icons.arrowRights,
                          color: AppColors.cffffff,
                        ))
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () =>
                      NavigationService.navigateTo(Routes.historyDetails),
                  child: CustomRecentScanCard(
                    imageUrl: Assets.images.productImg.path,
                    title: "ABC skin care solution",
                    date: "12 Dec 2024",
                    status: "Low Risk",
                    statusColor: AppColors.cFFB041,
                    // icon: Assets.icons.lowRisk,
                    time: '09:42',
                    statusIconColor: AppColors.cFFD21E,
                    icon: Assets.icons.lowRisk,
                  ),
                ),
                UIHelper.verticalSpace(12.h),
                GestureDetector(
                  onTap: () => NavigationService.navigateTo(
                      Routes.historyDetailsSafeMode),
                  child: CustomRecentScanCard(
                      icon: Assets.icons.safe,
                      imageUrl: Assets.images.productImg.path,
                      title: "ABC hair solution",
                      date: "17 Dec 2024",
                      status: "Safe",
                      statusColor: AppColors.c00B822,
                      // icon: Assets.icons.safe,
                      time: '09:42',
                      statusIconColor: AppColors.c00B822),
                ),
                UIHelper.verticalSpace(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Educational Insights",
                      style: TextFontStyle.textStyle14c252C2EOpenSansW400
                          .copyWith(
                              color: AppColors.c212121,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.36),
                    ),
                    GestureDetector(
                        onTap: () {
                          // Get.to(() => EducationalInsides());
                          NavigationService.popAndReplaceWihArgs(
                              Routes.bottomNav, {"pageNum": 1});
                        },
                        child: SvgPicture.asset(Assets.icons.arrowRights))
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: educationalInsightDataList.length,
                    itemBuilder: (context, index) {
                      final eduData = educationalInsightDataList[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: CustomEducationalInsightCardWidget(
                          onTap: () {
                            NavigationService.navigateTo(
                                Routes.insightDetailsScreen);
                          },
                          // onTap: () => NavigationService.navigateTo(),
                          backgroundColor: AppColors.cF7F7F7,
                          imageUrl: eduData["imageUrl"],
                          title: eduData["title"],
                          time: eduData["time"],
                          source: eduData["source"],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
