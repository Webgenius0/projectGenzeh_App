import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationScreeen extends StatefulWidget {
  const NotificationScreeen({super.key});

  @override
  State<NotificationScreeen> createState() => _NotificationScreeenState();
}

class _NotificationScreeenState extends State<NotificationScreeen> {
  bool isToggled = false;
  List<bool> toggles = [true, false, true, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        title: Text(
          'Notification',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(24.h),
              Text(
                'Notify me when...',
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    color: AppColors.c000000,
                    fontSize: 20.sp,
                    letterSpacing: -0.4),
              ),
              UIHelper.verticalSpace(24.h),
              _buildNotificationToggle(
                title: 'There is a New Recommendation',
                index: 0,
              ),
              //recommended section
              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'There is a New Recommendation',
              //             style: TextFontStyle.textStyle24c222222UrbanistW600
              //                 .copyWith(
              //                     color: AppColors.c212121,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w500,
              //                     letterSpacing: 0.028.sp),
              //           ),
              //           FlutterSwitch(
              //             height: 20.h,
              //             width: 36.w,
              //             padding: 2.sp,
              //             toggleSize: 16.sp,
              //             borderRadius: 100.0,
              //             activeColor: AppColors.c3689FD,
              //             inactiveColor: AppColors.cE9EFF7,
              //             value: toggles,

              //             onToggle: (value) {
              //               setState(() {
              //                 toggles[index] = value;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //       UIHelper.verticalSpace(16.h),
              //       Divider(
              //         color: AppColors.cECECEC,
              //         thickness: 1,
              //       ),
              //     ],
              //   ),
              // ),
              UIHelper.verticalSpace(11.h),

              //new book series
              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'There\'s a New Book Series',
              //             style: TextFontStyle.textStyle24c222222UrbanistW600
              //                 .copyWith(
              //                     color: AppColors.c212121,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w500,
              //                     letterSpacing: 0.028.sp),
              //           ),
              //           FlutterSwitch(
              //             height: 20.h,
              //             width: 36.w,
              //             padding: 2.sp,
              //             toggleSize: 16.sp,
              //             borderRadius: 100.0,
              //             activeColor: AppColors.c3689FD,
              //             inactiveColor: AppColors.cE9EFF7,
              //             value: isToggled,
              //             onToggle: (value) {
              //               setState(() {
              //                 isToggled = value;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //       UIHelper.verticalSpace(16.h),
              //       Divider(
              //         color: AppColors.cECECEC,
              //         thickness: 1,
              //       ),
              //     ],
              //   ),
              // ),

              _buildNotificationToggle(
                title: 'There\'s a New Book Series',
                index: 1,
              ),
              //from authors
              UIHelper.verticalSpace(11.h),

              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'There are Price Drops Available',
              //             style: TextFontStyle.textStyle24c222222UrbanistW600
              //                 .copyWith(
              //                     color: AppColors.c212121,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w500,
              //                     letterSpacing: 0.028.sp),
              //           ),
              //           FlutterSwitch(
              //             height: 20.h,
              //             width: 36.w,
              //             padding: 2.sp,
              //             toggleSize: 16.sp,
              //             borderRadius: 100.0,
              //             activeColor: AppColors.c3689FD,
              //             inactiveColor: AppColors.cE9EFF7,
              //             value: isToggled,
              //             onToggle: (value) {
              //               setState(() {
              //                 isToggled = value;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //       UIHelper.verticalSpace(16.h),
              //       Divider(
              //         color: AppColors.cECECEC,
              //         thickness: 1,
              //       ),
              //     ],
              //   ),
              // ),

              _buildNotificationToggle(
                title: 'There are Price Drops Available',
                index: 2,
              ),

              //purchase part

              UIHelper.verticalSpace(11.h),

              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             'There are Price Drops Available',
              //             style: TextFontStyle.textStyle24c222222UrbanistW600
              //                 .copyWith(
              //                     color: AppColors.c212121,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w500,
              //                     letterSpacing: 0.028.sp),
              //           ),
              //           FlutterSwitch(
              //             height: 20.h,
              //             width: 36.w,
              //             padding: 2.sp,
              //             toggleSize: 16.sp,
              //             borderRadius: 100.0,
              //             activeColor: AppColors.c3689FD,
              //             inactiveColor: AppColors.cE9EFF7,
              //             value: isToggled,
              //             onToggle: (value) {
              //               setState(() {
              //                 isToggled = value;
              //               });
              //             },
              //           ),
              //         ],
              //       ),
              //       UIHelper.verticalSpace(16.h),
              //       Divider(
              //         color: AppColors.cECECEC,
              //         thickness: 1,
              //       ),
              //     ],
              //   ),
              // ),

              _buildNotificationToggle(
                title: 'Enable App System Notifications',
                index: 3,
              ),

              //  purchase part

              UIHelper.verticalSpace(11.h),

              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enable App System Notifications',
                          style: TextFontStyle.textStyle24c222222UrbanistW600
                              .copyWith(
                                  color: AppColors.c212121,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.028.sp),
                        ),
                        FlutterSwitch(
                          height: 20.h,
                          width: 36.w,
                          padding: 2.sp,
                          toggleSize: 16.sp,
                          borderRadius: 100.0,
                          activeColor: AppColors.c3689FD,
                          inactiveColor: AppColors.cE9EFF7,
                          value: isToggled,
                          onToggle: (value) {
                            setState(() {
                              isToggled = value;
                            });
                          },
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(16.h),
                    Divider(
                      color: AppColors.cECECEC,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationToggle({required String title, required int index}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                  color: AppColors.c212121,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.028.sp,
                ),
              ),
            ),
            FlutterSwitch(
              height: 20.h,
              width: 36.w,
              padding: 2.sp,
              toggleSize: 16.sp,
              borderRadius: 100.0,
              activeColor: AppColors.c3689FD,
              inactiveColor: AppColors.cE9EFF7,
              value: toggles[index],
              onToggle: (value) {
                setState(() {
                  toggles[index] = value;
                });
              },
            ),
          ],
        ),
        UIHelper.verticalSpace(16.h),
        Divider(
          color: AppColors.cECECEC,
          thickness: 1,
        ),
      ],
    );
  }
}
