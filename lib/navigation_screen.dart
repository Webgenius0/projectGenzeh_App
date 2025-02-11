// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/account_and_setting/presentation/account_full_screen.dart';
import 'package:genzeh911/features/history/presentation/history_screen.dart';
import 'package:genzeh911/features/home/presentation/home_body_screen.dart';
import 'package:genzeh911/features/insight/presentation/insight_screen.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';

class BottomNavBar extends StatefulWidget {
  final int pageNum;
  const BottomNavBar({Key? key, required this.pageNum}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentTab;
  final List<Widget> screens = [
    HomeBodyScreen(),
    InsightScreen(),
    HistoryScreen(),
    AccountFullScreen()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    // Initialize currentTab and currentScreen based on passed pageNum
    currentTab = widget.pageNum;
    currentScreen = screens[currentTab];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leadingWidth: 85,
      //   leading: IconButton(
      //     onPressed: () {
      //       // Navigate back or perform an action
      //     },
      //     icon: SvgPicture.asset(
      //       Assets.icons.logos,
      //       width: 42.0.w, // Set desired width
      //       height: 42.0.h, // Set desired height
      //     ),
      //     iconSize: 42.0,
      //     constraints: const BoxConstraints(),
      //     padding: EdgeInsets.only(left: 20.w),
      //   ),
      //   actions: (currentTab != 1 && currentTab != 2 && currentTab != 3)
      //       ? [
      //           Padding(
      //             padding: EdgeInsets.only(right: 20.w),
      //             child: GestureDetector(
      //               onTap: () {
      //                 Get.to(() => NotificationListScreen());
      //               },
      //               child: SvgPicture.asset(Assets.icons.notification),
      //             ),
      //           )
      //         ]
      //       : null,
      // ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        height: 65.h,
        width: 65.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 5.sp, color: Colors.white),
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.c3689FD,
          onPressed: () => NavigationService.navigateTo(Routes.quickScanScreen),
          child: SvgPicture.asset(
            Assets.icons.scan,
            height: 24.h,
            width: 24.w,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Tab Bar
              Row(
                children: [
                  _buildTabItem(
                      index: 0,
                      icon: Assets.icons.home,
                      label: 'Home',
                      onTap: () {
                        _updateTab(0);
                      }),
                  _buildTabItem(
                      index: 1,
                      icon: Assets.icons.insides,
                      label: 'Insights',
                      onTap: () {
                        _updateTab(1);
                      }),
                ],
              ),
              // Right Tab Bar
              Row(
                children: [
                  _buildTabItem(
                      index: 2,
                      icon: Assets.icons.history,
                      label: 'History',
                      onTap: () {
                        _updateTab(2);
                      }),
                  _buildTabItem(
                      index: 3,
                      icon: Assets.icons.profile,
                      label: 'Profile',
                      onTap: () {
                        _updateTab(3);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      minWidth: 40,
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 24.h,
            width: 24.w,
            color: currentTab == index ? AppColors.c3689FD : AppColors.c484C52,
          ),
          Text(
            label,
            style: TextFontStyle.textStyle12c0A3004PoppinsW500.copyWith(
              color:
                  currentTab == index ? AppColors.c3689FD : AppColors.c484C52,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }

  void _updateTab(int index) {
    setState(() {
      currentTab = index;
      currentScreen = screens[index];
    });
  }
}
