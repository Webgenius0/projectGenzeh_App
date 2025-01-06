import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  _InsightScreenState createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  final List<Map<String, dynamic>> insightDataList = [
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
                  "Small steps, big change —\nlet’s finish this microplastic discovery",
                  style: TextFontStyle.textStyle18c4A80E1PoppinsW500,
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
                      "Educational Insights",
                      style: TextFontStyle.textStyle18cffffffOpenSansW600,
                    ),
                    UIHelper.verticalSpace(16.h),
                    Expanded(
                      child: ListView.builder(
                        itemCount: insightDataList.length,
                        itemBuilder: (context, index) {
                          final scanData = insightDataList[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: CustomEducationalInsightCardWidget(
                              onTap: () => NavigationService.navigateTo(
                                  Routes.insightDetailsScreen),
                              imageUrl: scanData["imageUrl"],
                              title: scanData["title"],
                              time: scanData["time"],
                              source: scanData["source"],
                            ),
                          );
                        },
                      ),
                    ),
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
