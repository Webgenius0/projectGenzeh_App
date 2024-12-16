import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/custom_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../gen/assets.gen.dart';

class OnboardingPageEleven extends StatefulWidget {
  final String title;
  final String description;

  const OnboardingPageEleven({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<OnboardingPageEleven> createState() => _OnboardingPageElevenState();
}

class _OnboardingPageElevenState extends State<OnboardingPageEleven> {
  TextEditingController nameController = TextEditingController();

  File? imageFile;
  final ImagePicker picker =
      ImagePicker(); // Use only the TextEditingController here

// Function to pick an image from gallery or camera
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path); // Set the selected file
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.verticalSpace(42.h),
            Text(
              widget.title,
              style: TextFontStyle.textStyle24c222222UrbanistW600
                  .copyWith(letterSpacing: -0.5.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(16.h),
            Text(widget.description,
                style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                  color: AppColors.c4B586B,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center),
            UIHelper.verticalSpace(24.h),

            Stack(
              children: [
                CircleAvatar(
                  radius: 60.r, // Circle's radius
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!) as ImageProvider
                      : AssetImage(Assets.images.profile.path),
                  backgroundColor:
                      Colors.grey[200], // Fallback background color
                ),
                Positioned(
                  right: 3,
                  top: 90,
                  child: GestureDetector(
                    onTap: () =>
                        pickImage(), // Call the method to pick an image
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
            ),
            CustomInputFieldWidget(
              labelText: "Full Name",
              isPasswordField: false,
              showSuffixIcon: true,
              hintText: 'Azizul Hakim',
              inputType: TextInputType.emailAddress,
              controller: nameController,
            ),
            UIHelper.verticalSpace(20.h),

            //date of birth section
            CustomDateOrCountryPickWidget(
              hintText: "1 January, 2003",
              labelText: ' Date of Birth',
              onButtonPressed: () {},
              suffixIcon: Assets.icons.dateOfBirth,
              isDatePicker: true,
            ),

            UIHelper.verticalSpace(20.h),
            CustomDateOrCountryPickWidget(
              hintText: "United States",
              labelText: 'Country',
              suffixIcon: Assets.icons.arrowBottom,
              onButtonPressed: () {},
              isDatePicker: false,
              showSuffixIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final String? loginIcon;
  final VoidCallback onPressed;
  final double? width;

  const CustomButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed,
      this.loginIcon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Container(
          height: 56.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.c3689FD,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(100.r),
          ),
          padding:
              EdgeInsets.only(top: 4.h, right: 4.w, bottom: 4.h, left: 0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loginIcon != null)
                SvgPicture.asset(
                  loginIcon!,
                  height: 24.h,
                  width: 24.w,
                ),
              if (loginIcon != null) UIHelper.horizontalSpace(12.w),
              Text(
                text,
                style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
