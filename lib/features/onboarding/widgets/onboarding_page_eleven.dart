import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/custom_country_picker_widget.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../helpers/ui_helpers.dart';
import '../../../gen/assets.gen.dart';

class OnboardingPageEleven extends StatefulWidget {
  final String? title;
  final String? description;

  const OnboardingPageEleven({
    super.key,
    this.title,
    this.description,
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
            UIHelper.verticalSpace(25.h),
            Text(
              widget.title ?? '',
              style: TextFontStyle.textStyle24c222222UrbanistW600
                  .copyWith(letterSpacing: -0.5.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(10.h),
            Text(widget.description ?? '',
                style: TextFontStyle.textStyle14c252C2EUrbanistW400.copyWith(
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
            UIHelper.verticalSpace(20.h),
            CustomInputFieldWidget(
              labelText: "Full Name",
              isPasswordField: false,
              showSuffixIcon: true,
              hintText: 'Azizul Hakim',
              inputType: TextInputType.name,
              controller: nameController,
            ),
            UIHelper.verticalSpace(20.h),

            //date of birth section
            CustomBirthDayAndCountryPickWidget(
              hintText: "1 January, 2003",
              labelText: 'Date of Birth',
              onButtonPressed: () {},
              suffixIcon: Assets.icons.dateOfBirth,
              isDatePicker: true,
            ),

            UIHelper.verticalSpace(20.h),
            CustomBirthDayAndCountryPickWidget(
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
