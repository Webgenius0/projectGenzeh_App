import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/model/scan_model.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
                    StreamBuilder(
                        stream: scanDataRx.dataFetcher,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return shimmer(
                                context: context, name: Assets.json.shimmer);
                          } else if (snapshot.hasError) {
                            return Text("");
                          } else if (snapshot.hasData) {
                            ScanModel scanModel = snapshot.data!;
                            final data = scanModel.data!;
                            return Expanded(
                                child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final scanData = data[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 12.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      NavigationService.navigateToWithArgs(
                                          Routes.historyDetails,
                                          {"text": scanData.name.toString()});
                                    },
                                    child: CustomRecentScanCard(
                                      imageUrl: "${scanData.imageUrl}",
                                      title: "${scanData.name}",
                                      date:
                                          "${DateFormat('dd MM yyyy').format(scanData.createdAt?.toLocal() ?? DateTime.now())}",
                                      time: "9:00 Pm",
                                      status: "${scanData.riskLevel}",
                                      statusColor: scanData.riskLevel == "safe"
                                          ? AppColors.c00B822
                                          : AppColors.cFFB041,
                                      // icon: scanData["icon"],
                                      statusIconColor:
                                          scanData.riskLevel == "safe"
                                              ? AppColors.c00B822
                                              : AppColors.cFFB041,
                                    ),
                                  ),
                                );
                              },
                            ));
                          } else {
                            return SizedBox.shrink();
                          }
                        })
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
