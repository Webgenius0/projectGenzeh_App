import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(Assets.icons.menu)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: SvgPicture.asset(Assets.icons.notification),
          )
        ],
        title: Text(
          'Logoipsum',
          style: TextStyle(
            color: AppColors.c55D0FF,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Scans',
                    style: TextFontStyle.textStyle14c252C2EOpenSansW400
                        .copyWith(
                            color: AppColors.c212121,
                            fontSize: 18.sp,
                            letterSpacing: -0.36),
                  ),
                  SvgPicture.asset(Assets.icons.arrowRight)
                ],
              ),
              UIHelper.verticalSpace(16.h),
              Container(
                height: 106.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.cF7F7F7),
                child: Row(
                  children: [
                    Image.asset(Assets.images.productImg1.path),
                    UIHelper.horizontalSpace(12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ABC skin care \nsolution',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        UIHelper.verticalSpace(8.w),
                        Text('12/30/2023  09:41'),
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(8.h),
              Container(
                height: 106.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.cF7F7F7),
                child: Row(
                  children: [
                    Image.asset(Assets.images.productImg1.path),
                    UIHelper.horizontalSpace(12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ABC skin care \nsolution',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        UIHelper.verticalSpace(8.w),
                        Text('12/30/2023  09:41'),
                      ],
                    )
                  ],
                ),
              ),
              UIHelper.verticalSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Educational Insight',
                    style: TextFontStyle.textStyle14c252C2EOpenSansW400
                        .copyWith(
                            color: AppColors.c212121,
                            fontSize: 18.sp,
                            letterSpacing: -0.36),
                  ),
                  SvgPicture.asset(Assets.icons.arrowRight)
                ],
              ),
              UIHelper.verticalSpace(16.h),
              Column(
                children: [
                  Container(
                    height: 106.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cF7F7F7),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ABC skin care \nsolution',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text('12/30/2023  09:41'),
                          ],
                        ),
                        Spacer(),
                        Image.asset(Assets.images.productImg1.path),

                        // UIHelper.horizontalSpace(12.w),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Container(
                    height: 106.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cF7F7F7),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ABC skin care \nsolution',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text('12/30/2023  09:41'),
                          ],
                        ),
                        Spacer(),
                        Image.asset(Assets.images.productImg1.path),

                        // UIHelper.horizontalSpace(12.w),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Container(
                    height: 106.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cF7F7F7),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ABC skin care \nsolution',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text('12/30/2023  09:41'),
                          ],
                        ),
                        Spacer(),
                        Image.asset(Assets.images.productImg1.path),

                        // UIHelper.horizontalSpace(12.w),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Container(
                    height: 106.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cF7F7F7),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ABC skin care \nsolution',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text('12/30/2023  09:41'),
                          ],
                        ),
                        Spacer(),
                        Image.asset(Assets.images.productImg1.path),

                        // UIHelper.horizontalSpace(12.w),
                      ],
                    ),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Container(
                    height: 106.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.cF7F7F7),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ABC skin care \nsolution',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            UIHelper.verticalSpace(8.w),
                            Text('12/30/2023  09:41'),
                          ],
                        ),
                        Spacer(),
                        Image.asset(Assets.images.productImg1.path),

                        // UIHelper.horizontalSpace(12.w),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
