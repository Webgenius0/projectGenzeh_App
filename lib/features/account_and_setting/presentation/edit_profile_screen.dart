import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_country_picker_widget.dart';
import 'package:genzeh911/common_widgets/custom_country_picker.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_gender_picker.dart';
import 'package:genzeh911/common_widgets/custom_text_feild.dart';
import 'package:genzeh911/common_widgets/image_picker_widget.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:genzeh911/provider/edit_profile.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? gender;
  String? dateofbirth;

  final ValueNotifier<String?> imageFileNotifier = ValueNotifier<String?>(null);

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
          'Profile',
          style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
              color: AppColors.c2B2B2B, fontSize: 20.sp, letterSpacing: -0.4),
        ),
        centerTitle: true,
        actions: [
          // GestureDetector(
          //     onTap: () {},
          //     child: Padding(
          //       padding: EdgeInsets.only(right: 18.w),
          //       child: SvgPicture.asset(Assets.icons.profileEdit),
          //     )
          //     )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: profileRx.getProfileData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return WaitingWidget();
                } else if (snapshot.hasData) {
                  ProfileModel profileModel = snapshot.data!;
                  final userData = profileModel.data!;

                  nameController.text = userData.fullname.toString();
                  phone.text = userData.phone.toString();
                  phone.text = userData.phone.toString();
                  email.text = userData.email.toString();
                  gender = userData.gender;
                  dateofbirth = DateFormat('yyyy-MM-dd').format(
                      userData.dateOfBirth?.toLocal() ?? DateTime.now());

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.verticalSpace(24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: imageFileNotifier,
                              builder: (context, imageFile, child) {
                                return Stack(
                                  fit: StackFit.loose,
                                  clipBehavior: Clip.none,
                                  children: [
                                    CircleAvatar(
                                      radius: 40.r, // Circle's radius
                                      backgroundImage: imageFile != null
                                          ? FileImage(File(imageFile))
                                          : userData.image != null
                                              ? NetworkImage(userData.image)
                                              : AssetImage(Assets
                                                  .images.productImg.path),
                                      backgroundColor: Colors.grey[
                                          200], // Fallback background color
                                    ),
                                    Positioned(
                                      right: 3,
                                      top: 62,
                                      child: GestureDetector(
                                        onTap: () => _showImageSourceDialog(
                                            context), // Call the method to pick an image
                                        child: Container(
                                          height: 28.h,
                                          width: 28.w,
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: AppColors.c222222,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
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
                        ],
                      ),
                      UIHelper.verticalSpace(16.h),
                      Text(
                        'Full Name',
                        style: TextFontStyle.textStyle24c222222UrbanistW600
                            .copyWith(
                                color: AppColors.c212121,
                                fontSize: 16.sp,
                                letterSpacing: -0.32),
                      ),
                      UIHelper.verticalSpace(12.h),
                      CustomTextFormField(
                        isPrefixIcon: true,
                        readOnly: false,
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
                        style: TextFontStyle.textStyle24c222222UrbanistW600
                            .copyWith(
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
                        controller: email,
                        hintText: 'andrew.ainsley@yahoo.com',
                      ),
                      UIHelper.verticalSpace(24.h),
                      Text(
                        'Phone',
                        style: TextFontStyle.textStyle24c222222UrbanistW600
                            .copyWith(
                                color: AppColors.c212121,
                                fontSize: 16.sp,
                                letterSpacing: -0.32),
                      ),
                      UIHelper.verticalSpace(12.h),

                      CustomCountryPicker(
                        textEditingController: phone,
                      ),
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
                        hintText: '${gender}',
                        isDatePicker: false,
                        labelText: 'Gender',
                        showSuffixIcon: true,
                        suffixIcon: Assets.icons.arrowBottom,
                        onButtonPressed: () {},
                      ),

                      UIHelper.verticalSpace(24.h),
                      BirthDayAndCountryPickWidget(
                        hintText: "${dateofbirth}",
                        labelText: ' Date of Birth',
                        onButtonPressed: () {},
                        suffixIcon: Assets.icons.dateOfBirth,
                        isDatePicker: true,
                      ),
                      UIHelper.verticalSpace(24.h),

                      customElevatedButton(
                        onPressed: () {
                          File? imageFile;
                          if (imageFileNotifier.value != null) {
                            imageFile = File(imageFileNotifier.value!);
                          } else {
                            imageFile = null; // No image selected
                          }
                          getEditProfileResponseRX
                              .editProfile(
                                  name: nameController.text.trim(),
                                  gender: context
                                      .read<EditProfileProvider>()
                                      .displayedHintText,
                                  number: phone.text.trim(),
                                  avaterImage: imageFile)
                              .then((success) {
                            profileRx.getProfile();
                            NavigationService.goBack;
                          });
                        },
                        child: Text(
                          'Continue',
                          style: TextFontStyle.textStyle14c252C2EOpenSansW400
                              .copyWith(
                            fontSize: 12.sp,
                            color: AppColors.cFFFFFF,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        bgColor: AppColors.allPrimaryColor,
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
        ),
      ),
    );
  }

  void _showImageSourceDialog(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => ImageSourceDialog(
        onImageSelected: (String imagePath) {
          imageFileNotifier.value = imagePath;
        },
      ),
    );
  }
}
