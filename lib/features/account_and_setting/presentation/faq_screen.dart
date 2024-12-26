import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/account_and_setting/widgets/faq_card_widget.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'FAQ',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(24.h),
              FaqCardWidget(
                collapsedTitle: 'What is TotalU?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
              FaqCardWidget(
                collapsedTitle: 'How does work?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
              FaqCardWidget(
                collapsedTitle: 'Who can use TotalU?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
              FaqCardWidget(
                collapsedTitle: 'Is TotalU free to use?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
              FaqCardWidget(
                collapsedTitle: 'Is my data secure with TotalU?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
              FaqCardWidget(
                collapsedTitle: 'Can I export my TotalU data?',
                subtitle:
                    'TotalU is a health and wellness app that helps you track calories. nutrition, water intake, steps, and more to achieve your fitness goals.',
              ),
              UIHelper.verticalSpace(12.h),
            ],
          ),
        ),
      ),
    );
  }
}
