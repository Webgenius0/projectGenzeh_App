import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_country_picker_widget.dart';
import 'package:genzeh911/common_widgets/custom_country_picker.dart';
import 'package:genzeh911/common_widgets/custom_gender_picker.dart';
import 'package:genzeh911/common_widgets/custom_text_feild.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
          'Profile',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: SvgPicture.asset(Assets.icons.profileEdit),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40.r, // Circle's radius
                    backgroundImage: AssetImage(Assets.images.profile.path),
                    // Fallback background color
                  ),
                ],
              ),
              UIHelper.verticalSpace(16.h),
              Text(
                'Full Name',
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    color: AppColors.c212121,
                    fontSize: 16.sp,
                    letterSpacing: -0.32),
              ),
              UIHelper.verticalSpace(12.h),
              CustomTextFormField(
                isPrefixIcon: true,
                readOnly: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: SvgPicture.asset(
                    Assets.icons.profile,
                    height: 24.sp,
                    width: 24.sp,
                  ),
                ),
                controller: nameController,
                hintText: 'Andrew Ainsley',
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'Email',
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    color: AppColors.c212121,
                    fontSize: 16.sp,
                    letterSpacing: -0.32),
              ),
              UIHelper.verticalSpace(12.h),
              CustomTextFormField(
                isPrefixIcon: true,
                readOnly: true,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: SvgPicture.asset(
                    Assets.icons.email,
                    height: 24.sp,
                    width: 24.sp,
                  ),
                ),
                controller: nameController,
                hintText: 'andrew.ainsley@yahoo.com',
              ),
              UIHelper.verticalSpace(24.h),
              Text(
                'Phone',
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                    color: AppColors.c212121,
                    fontSize: 16.sp,
                    letterSpacing: -0.32),
              ),
              UIHelper.verticalSpace(12.h),

              CustomCountryPicker(),
              // UIHelper.verticalSpace(24.h),
              // Text(
              //   'Gender',
              //   style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
              //       color: AppColors.c212121,
              //       fontSize: 16.sp,
              //       letterSpacing: -0.32),
              // ),
              UIHelper.verticalSpace(12.h),
              // CustomTextFormField(
              //   isPrefixIcon: true,
              //   readOnly: true,
              //   prefixIcon: Padding(
              //     padding: EdgeInsets.all(3.sp),
              //     child: SvgPicture.asset(
              //       Assets.icons.profile,
              //       height: 24.sp,
              //       width: 24.sp,
              //     ),
              //   ),
              //   controller: nameController,
              //   hintText: 'andrew.ainsley@yahoo.com',
              // ),
              // UIHelper.verticalSpace(24.h),
              // Text(
              //   'Date of Birth',
              //   style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
              //       color: AppColors.c212121,
              //       fontSize: 16.sp,
              //       letterSpacing: -0.32),
              // ),

              CustomGenderPicker(
                hintText: 'Male',
                isDatePicker: false,
                labelText: 'Gender',
                showSuffixIcon: true,
                suffixIcon: Assets.icons.arrowBottom,
                onButtonPressed: () {},
              ),

              UIHelper.verticalSpace(24.h),
              CustomBirthDayAndCountryPickWidget(
                hintText: "1 January, 2003",
                labelText: ' Date of Birth',
                onButtonPressed: () {},
                suffixIcon: Assets.icons.dateOfBirth,
                isDatePicker: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
