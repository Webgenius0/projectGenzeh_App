// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_educational_insight_card_widget.dart';
import 'package:genzeh911/common_widgets/custom_recent_scan_card_widget.dart';
import 'package:genzeh911/common_widgets/custome_network_image.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';
import 'package:genzeh911/features/home/model/insight_model.dart';
import 'package:genzeh911/features/home/model/scan_model.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  void initState() {
    super.initState();
    insightRx.insights();
    scanDataRx.scanProductData();
    profileRx.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 280.h,
          decoration: BoxDecoration(
            color: AppColors.c4A80E1,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          width: double.infinity,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UIHelper.verticalSpace(12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder(
                        stream: profileRx.dataFetcher,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            ProfileModel profileModel = snapshot.data!;
                            final userData = profileModel.data;

                            if (userData == null) {
                              return SizedBox
                                  .shrink(); // Handle null userData safely
                            }

                            return Row(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipOval(
                                    child: CustomNetworkImageWidget(
                                        urls: "${userData.image}"),
                                  ),
                                ),
                                UIHelper.horizontalSpace(12.w),
                                Text(
                                  "Welcome Back,\n${userData.fullname ?? "User"}",
                                  style: TextFontStyle
                                      .textStyle16cffffffOpenSansW600,
                                ),
                              ],
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Row(
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 40.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(12.w),
                                  Container(
                                    width: 150.w,
                                    height: 40.h,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ); // Show a loading indicator
                          } else {
                            return SizedBox
                                .shrink(); // Return an empty widget when no data
                          }
                        },
                      ),

                      // SvgPicture.asset(
                      //   Assets.icons.notification,
                      //   color: AppColors.cffffff,
                      // ),
                      InkWell(
                        // onTap: () {
                        //   NavigationService.navigateTo(
                        //       Routes.notificationScreeen);
                        // },
                        child: Container(
                          width: 40, // Width of the circular container
                          height: 40, // Height of the circular container
                          decoration: BoxDecoration(
                            color: AppColors.cC5EAFF4D.withOpacity(
                                .3), // Background color of the circle
                            shape:
                                BoxShape.circle, // Makes the container circular
                          ),
                          child: Icon(
                            Icons.notifications_none, // Notification bell icon
                            color: Colors.white, // Icon color
                            size: 20, // Icon size
                          ),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Scans",
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                                color: AppColors.cffffff,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.36),
                      ),
                      GestureDetector(
                          onTap: () {
                            NavigationService.navigateToWithArgs(
                                Routes.bottomNav, {"pageNum": 2});
                          },
                          child: SvgPicture.asset(
                            Assets.icons.arrowRights,
                            color: AppColors.cffffff,
                          ))
                    ],
                  ),
                  UIHelper.verticalSpace(16.h),
                  StreamBuilder(
                    stream: scanDataRx.dataFetcher,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center();
                      } else if (snapshot.hasError || snapshot.data == null) {
                        return Lottie.asset(Assets.json.noData,
                            width: 150, height: 150);
                      } else if (snapshot.hasData) {
                        ScanModel scanModel = snapshot.data!;
                        final data = scanModel.data;

                        // Check if data is null or empty before displaying it
                        if (data == null || data.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(Assets.json.noData,
                                    width: 150, height: 150),
                              ],
                            ),
                          );
                        }

                        int itemCount = data.length > 2 ? 2 : data.length;

                        return SizedBox(
                          height: 220.h,
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: itemCount,
                            separatorBuilder: (context, index) =>
                                UIHelper.verticalSpace(3.h),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  NavigationService.navigateToWithArgs(
                                    Routes.historyDetails,
                                    {
                                      "text": data[index].name,
                                      'id': data[index].id
                                    },
                                  );
                                },
                                child: CustomRecentScanCard(
                                  imageUrl: data[index].imageUrl ?? "",
                                  title: data[index].name ?? "Unknown",
                                  date: "${data[index].createdAt}",
                                  status:
                                      data[index].riskLevel?.toUpperCase() ??
                                          "N/A",
                                  statusColor: data[index].riskLevel == "safe"
                                      ? AppColors.c00B822
                                      : AppColors.cFFB041,
                                  time: '',
                                  statusIconColor: AppColors.cFFD21E,
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  UIHelper.verticalSpace(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Educational Insights",
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                                color: AppColors.c212121,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.36),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Get.to(() => EducationalInsides());
                          NavigationService.popAndReplaceWihArgs(
                              Routes.bottomNav, {"pageNum": 1});
                        },
                        child: SvgPicture.asset(
                          Assets.icons.arrowRights,
                          color: AppColors.c000000,
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(16.h),
                  StreamBuilder(
                      stream: insightRx.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return shimmer(
                              context: context, name: Assets.json.shimmer);
                        } else if (snapshot.hasError) {
                          return Text("");
                        } else if (snapshot.hasData) {
                          InsightModel insightModel = snapshot.data!;
                          final data = insightModel.data!;
                          int itemCount = data.length > 3 ? 3 : data.length;

                          return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: itemCount,
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
                      })
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
