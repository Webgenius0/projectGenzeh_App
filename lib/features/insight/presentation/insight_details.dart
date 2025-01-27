import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:genzeh911/common_widgets/custome_network_image.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/common_widgets/share_bottom_sheet_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/home/model/single_insight_model.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:genzeh911/networks/endpoints.dart';

class InsightDetailsScreen extends StatefulWidget {
  final String title;
  final int id;
  const InsightDetailsScreen(
      {super.key, required this.title, required this.id});

  @override
  State<InsightDetailsScreen> createState() => _InsightDetailsScreenState();
}

class _InsightDetailsScreenState extends State<InsightDetailsScreen> {
  @override
  void initState() {
    super.initState();
    insightDetailsRx.insights(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => NavigationService.goBack,
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              Assets.icons.arrowBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '${widget.title}',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
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
                icon: SvgPicture.asset(Assets.icons.insidesShare)),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: StreamBuilder(
                stream: insightDetailsRx.dataFetcher,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WaitingWidget(),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return WaitingWidget();
                  } else if (snapshot.hasData) {
                    SingleInsightModel singleInsightModel = snapshot.data!;
                    final data = singleInsightModel.data!;
                    return Column(
                      children: [
                        Image.asset(
                          Assets.images.imgDetails.path,
                          height: 229.sp,
                          fit: BoxFit.contain,
                        ),
                        UIHelper.verticalSpace(16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: Column(
                            children: [
                              Text(
                                '${data.title}',
                                style: TextFontStyle
                                    .textStylec212121OpenSansW600
                                    .copyWith(
                                        color: AppColors.c180E19,
                                        fontSize: 17.sp,
                                        letterSpacing: -0.36.sp),
                              ),
                              UIHelper.verticalSpace(16.h),
                              Row(
                                children: [
                                  // Image.asset(
                                  //   Assets.images.personImg.path,
                                  //   height: 53.h,
                                  //   width: 53.w,
                                  // ),
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    decoration:
                                        BoxDecoration(shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: CustomNetworkImageWidget(
                                          urls:
                                              "$imageUrl/${data.authorImage}"),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(10.h),
                                  Text(
                                    '${data.authorName}',
                                    style: TextFontStyle
                                        .textStylec212121OpenSansW600
                                        .copyWith(
                                            color: AppColors.c909090,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.36.sp),
                                  ),
                                  Spacer(),
                                  Text(
                                    '1m ago',
                                    style: TextFontStyle
                                        .textStylec212121OpenSansW600
                                        .copyWith(
                                            color: AppColors.c909090,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.36.sp),
                                  ),
                                ],
                              ),
                              UIHelper.verticalSpace(12.h),
                              HtmlWidget("${data.description}")
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                })),
      ),
    );
  }
}
