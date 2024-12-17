import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:get/get.dart';

class RecentScansScreen extends StatefulWidget {
  const RecentScansScreen({Key? key}) : super(key: key);

  @override
  _RecentScansScreenState createState() => _RecentScansScreenState();
}

class _RecentScansScreenState extends State<RecentScansScreen> {
  final List<Map<String, dynamic>> scanDataList = [
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "ABC Skin Care Solution",
      "date": "12 Dec 2024",
      "time": "09:42",
      "status": "Low Risk",
      "statusColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cFFD21E,
      "icon": Assets.icons.lowDisk,
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
    {
      "imageUrl": Assets.images.productImg.path,
      "title": "ABC Skin Care Solution",
      "date": "12 Dec 2024",
      "time": "09:42",
      "status": "Low Risk",
      "statusColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cFFD21E,
      "icon": Assets.icons.lowDisk,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Scans",
                  style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                      color: AppColors.c212121,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.36),
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => RecentScansScreen());
                    },
                    child: SvgPicture.asset(Assets.icons.arrowRights))
              ],
            ),
            UIHelper.verticalSpace(16.h),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: scanDataList.length,
              itemBuilder: (context, index) {
                final scanData = scanDataList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomRecentScanCard(
                    imageUrl: scanData["imageUrl"],
                    title: scanData["title"],
                    date: scanData["date"],
                    time: scanData["time"],
                    status: scanData["status"],
                    statusColor: scanData["statusColor"],
                    icon: scanData["icon"],
                    statusIconColor: scanData["statusIconColor"],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
