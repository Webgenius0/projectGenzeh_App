import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/share_bottom_sheet_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class InsightDetailsScreen extends StatefulWidget {
  const InsightDetailsScreen({super.key});

  @override
  State<InsightDetailsScreen> createState() => _InsightDetailsScreenState();
}

class _InsightDetailsScreenState extends State<InsightDetailsScreen> {
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
          'Monac population s...',
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
          child: Column(
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
                      'Monarch population soars 4,900 percent since last year in thrilling 2021 western migration',
                      style: TextFontStyle.textStylec212121OpenSansW600
                          .copyWith(
                              color: AppColors.c180E19,
                              fontSize: 17.sp,
                              letterSpacing: -0.36.sp),
                    ),
                    UIHelper.verticalSpace(16.h),
                    Row(
                      children: [
                        Image.asset(
                          Assets.images.personImg.path,
                          height: 53.h,
                          width: 53.w,
                        ),
                        UIHelper.horizontalSpace(10.h),
                        Text(
                          'By Andy Corbley',
                          style: TextFontStyle.textStylec212121OpenSansW600
                              .copyWith(
                                  color: AppColors.c909090,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.36.sp),
                        ),
                        Spacer(),
                        Text(
                          '1m ago',
                          style: TextFontStyle.textStylec212121OpenSansW600
                              .copyWith(
                                  color: AppColors.c909090,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.36.sp),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(12.h),
                    Text(
                      'When just 200 Western monarch butterflies \narrived in the Pismo Beach Butterfly Grove \nfrom their northerly migration last year, park \nrangers feared the treasured insect would \nsoon be gone forever. \nnThis year, however, volunteers tallied their \nnumbers at over 100,000, a spectacular \nswarm of hope that traveled down from as \nfar north as Canada to the spend the winter \non the California coast. It’s expected that the monarch butterfly will be placed on the Endangered Species List soon, due to declines in both western and eastern monarch butterfly numbers. Genetically indistinguishable, they are separate merely for the fact that monarchs living and migrating east of the Rockies overwinter in Mexico, while those on the western side of the Rockies overwinter along California’s west coast.',
                      style:
                          TextFontStyle.textStylec212121OpenSansW600.copyWith(
                        color: AppColors.c000000,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
