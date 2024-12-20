import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class NotificationEmptyScreen extends StatefulWidget {
  const NotificationEmptyScreen({super.key});

  @override
  State<NotificationEmptyScreen> createState() =>
      _NotificationEmptyScreenState();
}

class _NotificationEmptyScreenState extends State<NotificationEmptyScreen> {
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
              Container(
                  height: 240.h,
                  width: 240.w,
                  child: SvgPicture.asset(Assets.icons.notificationImg)),
              Text(
                'Empty',
                style: TextFontStyle.textStyle24c2B2B2BInterW600.copyWith(
                  color: AppColors.c000000,
                  letterSpacing: -0.48.sp,
                ),
              ),
              UIHelper.verticalSpace(12.h),
              Text(
                'You dont have any notification at this time',
                style: TextFontStyle.textStyle14c252C2EOpenSansW400
                    .copyWith(color: AppColors.c000000, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
