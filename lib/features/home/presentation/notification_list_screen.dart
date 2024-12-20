// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Daily Step Goal Achieved!",
      "description":
          "Awesome Job! You've hit your step goal for the day. Keep moving!",
      "date": "Today, Dec 22,2024",
      "time": "09:41 AM",
      "icon": Assets.icons.star,
      "isNew": true,
    },
    {
      "title": "Weekly Progress Report",
      "description":
          "Great job this week! Check your progress in the Tracker menu.",
      "date": "Today, Dec 22,2024",
      "time": "09:41 AM",
      "icon": Assets.icons.activity,
      "isNew": true,
    },
    {
      "title": "New Artical Available",
      "description":
          "Check out the latest tips on healthy eating in our Articles section.",
      "date": "Today, Dec 22,2024",
      "time": "09:41 AM",
      "icon": Assets.icons.newArticle,
      "isNew": false,
    },
    {
      "title": "Join Our Challenge!",
      "description": "Compete With friends and reach your goals together.",
      "date": "Dec 21,2024",
      "time": "09:41 AM",
      "icon": Assets.icons.star,
      "isNew": false,
    },
    {
      "title": "Account Security Update",
      "description":
          "For your safety, please verify your account details. Secure your",
      "date": "Dec 21,2024",
      "time": "09:41 AM",
      "icon": Assets.icons.securityUpdate,
      "isNew": false,
    },
  ];

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
        title: Text(
          'Notification',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: SvgPicture.asset(Assets.icons.setting),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UIHelper.verticalSpace(20.h),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  final bool isSpecialDate =
                      notification["date"] == "Dec 21,2024";
                  final bool showDate = index == 0 ||
                      (notification["date"] !=
                          notifications[index - 1]["date"]);

                  return Padding(
                    padding: EdgeInsets.only(
                      top: isSpecialDate
                          ? 10.h
                          : 0.0, // Add 20 pixels of padding on top
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDate)
                          Row(
                            children: [
                              Text(
                                notification["date"] ?? '',
                                style: TextFontStyle
                                    .textStyle14c252C2EOpenSansW400
                                    .copyWith(color: AppColors.c717171),
                              ),
                              UIHelper.horizontalSpace(15.w),
                              Expanded(
                                child: Divider(
                                  color: AppColors.cE7E7E7,
                                  thickness: 1,
                                ),
                              )
                            ],
                          ),
                        UIHelper.verticalSpace(15.h),
                        ListTile(
                          onTap: () {
                            //Notification is click
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: SizedBox(
                            width: 48.w, // Fixed size for consistency
                            height: 48.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Border
                                Container(
                                  width: 48.w, // Border circle size
                                  height: 48.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: AppColors
                                          .cE7E7E7, // Light grey border color
                                      width: 1.2, // Border thickness
                                    ),
                                  ),
                                ),
                                // Icon centered

                                SvgPicture.asset(
                                  notification["icon"],
                                  height: 24.h,
                                  width: 24.w,
                                  color: AppColors.c2B2B2B,
                                )
                              ],
                            ),
                          ),
                          title: Text(
                            notification["title"],
                            style: TextFontStyle.textStylec212121OpenSansW600
                                .copyWith(
                                    color: AppColors.c2B2B2B,
                                    fontSize: 16.sp,
                                    letterSpacing: -0.32.sp),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UIHelper.verticalSpace(8.h),
                              Text(
                                notification["description"],
                                style: TextFontStyle
                                    .textStyle14c252C2EOpenSansW400
                                    .copyWith(
                                  color: AppColors.c2B2B2B,
                                ),
                              ),
                              UIHelper.verticalSpace(12.h),
                              Text(
                                notification["time"],
                                style: TextFontStyle
                                    .textStyle14c252C2EOpenSansW400
                                    .copyWith(
                                  color: AppColors.c717171,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          trailing: notification["isNew"] ?? false
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 12.w, // Circle diameter
                                      height: 12.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.c55D0FF, // Blue color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(10.w),
                                    SvgPicture.asset(
                                        Assets.icons.arrowRightNotification),
                                  ],
                                )
                              : null,
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
