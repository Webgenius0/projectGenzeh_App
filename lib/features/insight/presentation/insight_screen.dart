import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/model/insight_model.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/loading.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';

class InsightScreen extends StatefulWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  _InsightScreenState createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
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
                Expanded(
                  child: Text(
                    "Knowing How Microplastics are Impacting Your Health, is a Key Step Towards Longevity.",
                    style: TextFontStyle.textStyle18c4A80E1PoppinsW700
                        .copyWith(fontSize: 20),
                  ),
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
                        child: StreamBuilder(
                            stream: insightRx.dataFetcher,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return shimmer(
                                  context: context,
                                );
                              } else if (snapshot.hasError) {
                                return Text("");
                              } else if (snapshot.hasData) {
                                InsightModel insightModel = snapshot.data!;
                                final data = insightModel.data!;

                                return ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    final eduData = data[index];
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: CustomEducationalInsightCardWidget(
                                        onTap: () {
                                          NavigationService.navigateToWithArgs(
                                              Routes.insightDetailsScreen, {
                                            "title": eduData.title,
                                            "id": eduData.id
                                          });
                                        },
                                        // onTap: () => NavigationService.navigateTo(),
                                        backgroundColor: AppColors.cF7F7F7,
                                        imageUrl: "${eduData.image}",
                                        title: "${eduData.title}",
                                        time: "${eduData.createdAt}",
                                        source: "${eduData.description}",
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            }))
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
