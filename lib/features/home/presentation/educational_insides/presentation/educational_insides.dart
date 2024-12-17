import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class EducationalInsides extends StatefulWidget {
  const EducationalInsides({Key? key}) : super(key: key);

  @override
  _EducationalInsidesState createState() => _EducationalInsidesState();
}

class _EducationalInsidesState extends State<EducationalInsides> {
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
      child: SingleChildScrollView(
        child: Column(
          children: [
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
              ],
            ),
            UIHelper.verticalSpace(16.h),
            ListView.builder(
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
            )
          ],
        ),
      ),
    );
  }
}
