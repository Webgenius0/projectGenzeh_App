// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common_widgets/share_bottom_sheet_widget.dart';

class ScanningReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c3689FD,
        title: Text(
          'Scanning Result',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              fontSize: 20.sp,
              letterSpacing: -0.4.sp,
              color: AppColors.c00340D),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              Assets.icons.arrowBack,
              height: 24.h,
              width: 24.w,
              color: AppColors.cFFFFFF,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                    ),
                    builder: (context) => ShareBottomSheet(),
                  );
                },
                icon: SvgPicture.asset(
                  Assets.icons.insidesShare,
                  color: AppColors.cFFFFFF,
                )),
          )
          // Padding(
          //   padding: EdgeInsets.only(right: 24.w),
          //   child: SvgPicture.asset(
          //     Assets.icons.editProfile,
          //     height: 24.h,
          //     width: 24.w,
          //   ),
          // )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                  color: AppColors.c3689FD,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.r),
                      bottomRight: Radius.circular(32.r))),
              child: Column(
                children: [
                  Text(
                    'Microplastic Found',
                    style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                        fontSize: 18.sp,
                        letterSpacing: -0.36.sp,
                        color: AppColors.cFFFFFF),
                  ),
                  UIHelper.verticalSpace(12.h),
                  CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 10.0,
                    percent: 0.63,
                    center: Column(
                      children: [
                        Text(
                          "83",
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStylec212121OpenSansW600
                              .copyWith(
                                  fontSize: 64.sp,
                                  letterSpacing: -0.64.sp,
                                  color: AppColors.cFFFFFF),
                        ),
                        Text(
                          "Out of 100",
                          textAlign: TextAlign.center,
                          style: TextFontStyle.textStylec212121OpenSansW600
                              .copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.64.sp,
                                  color: AppColors.c034057),
                        ),
                      ],
                    ),
                    progressColor: Colors.yellow,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 37.h,
                    width: 117.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.cFF0000,
                      borderRadius: BorderRadius.circular(33.r),
                    ),
                    child: Text(
                      "High Rish",
                      style: TextFontStyle.textStylec212121OpenSansW600
                          .copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: AppColors.cFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            // Content section
            Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total serum calcium is a blood test done to measure the free and bound forms of calcium. It is often a part of screening tests to detect abnormally high and low levels of calcium, as both can affect health.",
                    style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.c000000),
                  ),
                  UIHelper.verticalSpace(24.h),
                  ExpandableTile(
                    title: "Impact on overall health?",
                    content:
                        "Abnormal levels of calcium can occur due to problems in calcium absorption, bone diseases, overactive thyroid gland, parathyroid disease, kidney or liver diseases.",
                  ),
                  ExpandableTile(
                    title: "How to improve health conditions?",
                    content:
                        "For low calcium levels, a diet with calcium-rich foods is recommended. See a doctor and discuss the need for calcium supplements.",
                  ),
                  ExpandableTile(
                    title: "What will happen if you use it for long time?",
                    content:
                        "Prolonged exposure or usage without monitoring can lead to adverse effects. It’s best to consult with a specialist for a long-term plan.",
                  ),
                  ExpandableTile(
                    title: "Recommended Tips",
                    content:
                        "Maintain a balanced diet, stay hydrated, and get regular health check-ups.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableTile extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableTile({required this.title, required this.content});

  @override
  _ExpandableTileState createState() => _ExpandableTileState();
}

class _ExpandableTileState extends State<ExpandableTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.title,
                style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                    color: AppColors.c180E19,
                    fontSize: 16.sp,
                    letterSpacing: -0.32.sp),
              ),
              trailing: SvgPicture.asset(
                isExpanded ? Assets.icons.arrowBottom : Assets.icons.arrowUp,
                height: 16.sp,
                width: 16.w,
                color: AppColors.c000000,
              )),
        ),
        if (isExpanded)
          Text(
            widget.content,
            style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c7B7B7B,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
