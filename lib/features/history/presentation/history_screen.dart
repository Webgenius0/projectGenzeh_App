import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, dynamic>> historyDataList = [
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "ABC Skin Care Solution",
      "date": "12 Dec 2024",
      "time": "09:42",
      "status": "Caution",
      "statusColor": AppColors.cFFB041,
      "statusIconColor": AppColors.cFFD21E,
      "icon": Assets.icons.lowRisk,
    },
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "Nutrient Supplement",
      "date": "10 Dec 2024",
      "time": "08:15",
      "status": "Safe",
      "statusColor": Colors.green,
      "statusIconColor": Colors.green,
      "icon": Assets.icons.safe,
    },
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "XYZ Hair Oil",
      "date": "11 Dec 2024",
      "time": "10:30",
      "status": "High Risk",
      "statusColor": Colors.redAccent,
      "statusIconColor": Colors.redAccent,
      "icon": Assets.icons.safe,
    },
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "ABC Skin Care Solution",
      "date": "12 Dec 2024",
      "time": "09:42",
      "status": "Low Risk",
      "statusColor": AppColors.cFFB041,
      "statusIconColor": AppColors.cFFD21E,
      "icon": Assets.icons.lowRisk,
    },
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "XYZ Hair Oil",
      "date": "11 Dec 2024",
      "time": "10:30",
      "status": "High Risk",
      "statusColor": Colors.redAccent,
      "statusIconColor": Colors.redAccent,
      "icon": Assets.icons.safe,
    },
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "Nutrient Supplement",
      "date": "10 Dec 2024",
      "time": "08:15",
      "status": "Safe",
      "statusColor": Colors.green,
      "statusIconColor": Colors.green,
      "icon": Assets.icons.safe,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 85,
        leading: IconButton(
          onPressed: () {
            // Navigate back or perform an action
          },
          icon: SvgPicture.asset(
            Assets.icons.logos,
            width: 42.0.w, // Set desired width
            height: 42.0.h, // Set desired height
          ),
          iconSize: 42.0,
          constraints: const BoxConstraints(),
          padding: EdgeInsets.only(left: 20.w),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "A cleaner future starts here —\ncheck your scan results",
                  style: TextFontStyle.textStyle18c4A80E1PoppinsW700
                      .copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(16.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.c4A80E1,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(24.h),
                    Text(
                      "Recent Scans",
                      style: TextFontStyle.textStyle18cffffffOpenSansW600,
                    ),
                    UIHelper.verticalSpace(16.h),
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: historyDataList.length,
                      itemBuilder: (context, index) {
                        final scanData = historyDataList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: GestureDetector(
                            onTap: () {
                              NavigationService.navigateTo(
                                  Routes.historyDetails);
                            },
                            child: CustomRecentScanCard(
                              imageUrl: scanData["imageUrl"],
                              title: scanData["title"],
                              date: scanData["date"],
                              time: scanData["time"],
                              status: scanData["status"],
                              statusColor: scanData["statusColor"],
                              // icon: scanData["icon"],
                              statusIconColor: scanData["statusIconColor"],
                            ),
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
