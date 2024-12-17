import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/presentation/educational_insides/presentation/educational_insides.dart';
import 'package:genzeh911/features/home/presentation/recent_scans/presentation/recent_scans_screen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:get/get.dart';

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
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.winter.path,
      "title": "2021's most brilliant horror movie",
      "time": "4min ago",
      "source": "Nature Channel",
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
    {
      "imageUrl": Assets.images.computer.path,
      "title": "US jobs growth disappoints as recovery falters",
      "time": "4min ago",
      "source": "Nature Channel",
      "sourceColor": AppColors.cFFD21E,
      "statusIconColor": AppColors.cC4C4C4,
      "icon": Assets.icons.dotIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
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
          CustomRecentScanCard(
            imageUrl: Assets.images.productImg.path,
            title: "ABC skin care solution",
            date: "12 Dec 2024",
            status: "Low Risk",
            statusColor: AppColors.cFFD21E,
            icon: Assets.icons.lowDisk,
            time: '09:42',
            statusIconColor: AppColors.cFFD21E,
          ),
          UIHelper.verticalSpace(8.h),
          CustomRecentScanCard(
              imageUrl: Assets.images.productImg.path,
              title: "ABC hair solution",
              date: "17 Dec 2024",
              status: "Safe",
              statusColor: AppColors.c00B822,
              icon: Assets.icons.safe,
              time: '09:42',
              statusIconColor: AppColors.c00B822),
          UIHelper.verticalSpace(24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Educational Insight",
                style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                    color: AppColors.c212121,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.36),
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(() => EducationalInsides());
                  },
                  child: SvgPicture.asset(Assets.icons.arrowRights))
            ],
          ),
          UIHelper.verticalSpace(24.h),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: educationalInsightDataList.length,
              itemBuilder: (context, index) {
                final scanData = educationalInsightDataList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: CustomEducationalInsightCardWidget(
                    imageUrl: scanData["imageUrl"],
                    title: scanData["title"],
                    time: scanData["time"],
                    source: scanData["source"],
                    sourceColor: scanData["sourceColor"],
                    icon: scanData["icon"],
                    statusIconColor: scanData["statusIconColor"],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
