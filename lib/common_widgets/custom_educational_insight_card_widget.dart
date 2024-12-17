import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomEducationalInsightCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  final String time;
  final String source;
  final Color sourceColor;
  final Color statusIconColor;
  final String icon;

  const CustomEducationalInsightCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
    required this.source,
    required this.sourceColor,
    required this.statusIconColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342.w,
      decoration: BoxDecoration(
        color: AppColors.cF7F7F7,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextFontStyle.textStyle12c0A3004PoppinsW500,
                  ),
                  UIHelper.verticalSpace(3.h),
                  Text(
                    'The new Candyman and how horror is',
                    style: TextFontStyle.textStyle12c0A3004PoppinsW500.copyWith(
                        color: AppColors.c757575,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  UIHelper.verticalSpace(8.h),
                  Row(
                    children: [
                      Text(
                        source,
                        style: TextFontStyle.textStyle12c0A3004PoppinsW500
                            .copyWith(
                                fontSize: 9.sp,
                                color: AppColors.cF98121,
                                fontWeight: FontWeight.w300),
                      ),
                      UIHelper.horizontalSpace(7.h),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.dotIcon),
                          UIHelper.horizontalSpace(7.h),
                          Text(
                            time,
                            style: TextFontStyle.textStyle14c252C2EOpenSansW400
                                .copyWith(
                                    fontSize: 12.sp, color: AppColors.c757575),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(imageUrl, width: 77.w, height: 77.h),
          ],
        ),
      ),
    );
  }
}
