// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/custom_appbar.dart';
import 'package:genzeh911/common_widgets/custom_country_picker_widget.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/common_widgets/image_picker_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:genzeh911/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../../../helpers/ui_helpers.dart';

class SignUpScreen extends StatefulWidget {
  final String? title;
  final String? description;

  const SignUpScreen({
    super.key,
    this.title,
    this.description,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: Text(
        "complete your profile",
        style: TextFontStyle.textStyle24c222222QuandoW400.copyWith(
          letterSpacing: -0.48.sp,
        ),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: context.read<AuthProvider>().formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UIHelper.verticalSpace(25.h),
                  Text(
                    widget.title ?? '',
                    style: TextFontStyle.textStyle24c222222UrbanistW600
                        .copyWith(
                            letterSpacing: -0.5.sp, color: AppColors.c000000),
                  ),
                  UIHelper.verticalSpace(10.h),
                  Text(widget.description ?? '',
                      style:
                          TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                        color: AppColors.c4B586B,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center),
                  UIHelper.verticalSpace(24.h),

                  ValueListenableBuilder(
                      valueListenable:
                          context.read<AuthProvider>().imageFileNotifier,
                      builder: (context, imageFile, child) {
                        return Stack(
                          children: [
                            CircleAvatar(
                              radius: 60.r, // Circle's radius
                              backgroundImage: imageFile != null
                                  ? FileImage(File(imageFile))
                                  : AssetImage(Assets.images.profile.path),
                              backgroundColor:
                                  Colors.grey[200], // Fallback background color
                            ),
                            Positioned(
                              right: 3,
                              top: 90,
                              child: GestureDetector(
                                onTap: () => _showImageSourceDialog(
                                    context), // Call the method to pick an image
                                child: Container(
                                  height: 28.h,
                                  width: 28.w,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: AppColors.c222222,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: SvgPicture.asset(
                                    Assets.icons.editProfile,
                                    height: 28.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  UIHelper.verticalSpace(20.h),
                  CustomInputFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    labelText: "Full Name",
                    isPasswordField: false,
                    showSuffixIcon: true,
                    hintText: 'Enter your name',
                    inputType: TextInputType.name,
                    controller: context.read<AuthProvider>().name,
                  ),
                  UIHelper.verticalSpace(20.h),

                  //date of birth section
                  CustomBirthDayAndCountryPickWidget(
                    hintText: "Date",
                    labelText: 'Date of Birth',
                    onButtonPressed: () {},
                    suffixIcon: Assets.icons.dateOfBirth,
                    isDatePicker: true,
                  ),

                  UIHelper.verticalSpace(20.h),
                  CustomBirthDayAndCountryPickWidget(
                    hintText: "Country",
                    labelText: 'Country',
                    suffixIcon: Assets.icons.arrowBottom,
                    onButtonPressed: () {},
                    isDatePicker: false,
                    showSuffixIcon: true,
                  ),
                  UIHelper.verticalSpace(35.h),

                  customElevatedButton(
                    onPressed: () {
                      final authProvider = context.read<AuthProvider>();
                      final isCountrySelected = authProvider.selectedCountry !=
                          null; // Assuming a variable for selected country
                      final isDateSelected = authProvider.displayedHintText !=
                          null; // Assuming a variable for selected date

                      if (authProvider.formkey.currentState!.validate()) {
                        if (isCountrySelected && isDateSelected) {
                          NavigationService.navigateTo(Routes.signup2);
                        } else {
                          String errorMessage = '';
                          if (!isCountrySelected)
                            errorMessage += 'Please select a country. ';
                          if (!isDateSelected)
                            errorMessage += 'Please select a date.';

                          ToastUtil.showShortToast(errorMessage);
                        }
                      }
                    },
                    child: Text(
                      'Continue',
                      style:
                          TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.cFFFFFF,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    bgColor: AppColors.allPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => ImageSourceDialog(
        onImageSelected: (String imagePath) {
          context.read<AuthProvider>().imageFileNotifier.value = imagePath;
        },
      ),
    );
  }
}
