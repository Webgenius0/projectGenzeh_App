// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/model/history_details_model.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../common_widgets/share_bottom_sheet_widget.dart';

class HistoryDetails extends StatefulWidget {
  final String text;
  final int id;
  HistoryDetails({required this.text, required this.id});

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {
  @override
  void initState() {
    super.initState();
    scanDatDetailsaRx.singleProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c3689FD,
        title: Text(
          '${widget.text}',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              fontSize: 20.sp,
              letterSpacing: -0.4.sp,
              overflow: TextOverflow.ellipsis,
              color: AppColors.cffffff),
        ),
        leading: IconButton(
          onPressed: () => NavigationService.goBack,
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
        ],
      ),
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: scanDatDetailsaRx.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WaitingWidget();
                } else if (snapshot.hasError) {
                  return Lottie.asset(Assets.json.noData);
                } else if (snapshot.hasData) {
                  HistoryDetailsModel historyDetailsModel = snapshot.data!;
                  return Column(
                    children: [
                      // Header section
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 25.h),
                        decoration: BoxDecoration(
                            color: AppColors.c3689FD,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.r),
                                bottomRight: Radius.circular(32.r))),
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              radius: 70.0,
                              lineWidth: 8.0,
                              percent: 0.63,
                              center: Column(
                                children: [
                                  UIHelper.verticalSpace(20.h),
                                  Text(
                                    "${historyDetailsModel.data?.score}",
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle
                                        .textStylec212121OpenSansW600
                                        .copyWith(
                                            fontSize: 40.sp,
                                            letterSpacing: -0.64.sp,
                                            color: AppColors.cFFFFFF),
                                  ),
                                  Text(
                                    "Out of 100",
                                    textAlign: TextAlign.center,
                                    style: TextFontStyle
                                        .textStylec212121OpenSansW600
                                        .copyWith(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.64.sp,
                                            color: AppColors.cffffff),
                                  ),
                                ],
                              ),
                              progressColor: AppColors.cC4ECFC,
                              backgroundColor:
                                  AppColors.c2A2A2A1A.withOpacity(.4),
                            ),
                            UIHelper.verticalSpace(12.h),
                            Text(
                              '${historyDetailsModel.data?.microplastic?.toUpperCase()}',
                              style: TextFontStyle.textStylec212121OpenSansW600
                                  .copyWith(
                                      fontSize: 18.sp,
                                      letterSpacing: -0.36.sp,
                                      color: AppColors.cFFFFFF),
                            ),
                            UIHelper.verticalSpace(15.h),
                            Container(
                              height: 42.h,
                              width: 113.w,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 24.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.cFFC300,
                                borderRadius: BorderRadius.circular(33.r),
                              ),
                              child: Text(
                                "${historyDetailsModel.data?.riskLevel}",
                                style: TextFontStyle
                                    .textStylec212121OpenSansW600
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
                              "${historyDetailsModel.data?.description}",
                              style: TextFontStyle.textStylec212121OpenSansW600
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: AppColors.c000000,
                                      height: 1.5),
                            ),
                            UIHelper.verticalSpace(24.h),
                            ExpandableTile(
                              title: "Impact on overall health?",
                              content:
                                  "${historyDetailsModel.data?.healthImpact}",
                            ),
                            ExpandableTile(
                              title: "How to improve health conditions?",
                              content:
                                  "${historyDetailsModel.data?.howToImprove}",
                            ),
                            // ExpandableTile(
                            //   title:
                            //       "What will happen if you use it for long time?",
                            //   content:
                            //       "Prolonged exposure or usage without monitoring can lead to adverse effects. It’s best to consult with a specialist for a long-term plan.",
                            // ),
                            ExpandableTile(
                              title: "Recommended Tips",
                              content:
                                  "${historyDetailsModel.data?.recommendationTips}",
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              })),
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
              height: 1.5.h,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
