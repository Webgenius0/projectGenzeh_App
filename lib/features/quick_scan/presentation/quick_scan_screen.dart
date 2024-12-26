import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';

class QuickScanScreen extends StatelessWidget {
  const QuickScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.c000000
                .withOpacity(0.4.sp), // Placeholder color for camera preview
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 53,
            left: 10,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.icons.flashOff,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Text(
                "Scanning",
                style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                  color: AppColors.cFFFFFF,
                  fontSize: 20.sp,
                  letterSpacing: -0.4.sp,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 10,
            child: IconButton(
              onPressed: () => NavigationService.goBack,
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bottom Photo Carousel Placeholder
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.cC4C4C4,
                        borderRadius: BorderRadius.circular(48.r)),
                    height: 70.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.pic
                              .path, // Placeholder for carousel images
                          width: 48.w,
                          height: 48.h,
                        ),
                        GestureDetector(
                          onTap: () => NavigationService.navigateTo(
                              Routes.scanningReportScreen),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.icons.camera,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: AppColors.c000000.withOpacity(0.1)),
                          child: IconButton(
                            onPressed: () {
                              // Add functionality for camera switching
                            },
                            icon: Icon(
                              Icons.cameraswitch,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
