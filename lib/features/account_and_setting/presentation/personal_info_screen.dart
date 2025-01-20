import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/common_widgets/custom_text_feild.dart';
import 'package:genzeh911/common_widgets/loading_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/account_and_setting/model/profile_model.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:intl/intl.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
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
          GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.editprofile);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 18.w),
                child: SvgPicture.asset(Assets.icons.profileEdit),
              ))
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpace(24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40.r, // Circle's radius
                              backgroundImage:
                                  AssetImage(Assets.images.profile.path),
                              // Fallback background color
                            ),
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
                          readOnly: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: SvgPicture.asset(
                              Assets.icons.profile,
                              height: 24.sp,
                              width: 24.sp,
                            ),
                          ),
                          controller:
                              TextEditingController(text: userData.fullname),
                          hintText: '',
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
                          controller:
                              TextEditingController(text: userData.email),
                          hintText: '',
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

                        CustomTextFormField(
                          isPrefixIcon: true,
                          readOnly: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(3.sp),
                            child: Image.asset(
                              Assets.images.calll.path,
                              height: 24.sp,
                              width: 24.sp,
                            ),
                          ),
                          controller:
                              TextEditingController(text: userData.phone),
                          hintText: '',
                        ),

                        UIHelper.verticalSpace(12.h),
                        // CustomTextFormField(

                        Text(
                          'Gender',
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
                            child: Image.asset(
                              Assets.images.a6648537.path,
                              height: 24.sp,
                              width: 24.sp,
                            ),
                          ),
                          controller:
                              TextEditingController(text: userData.gender),
                          hintText: '',
                        ),
                        UIHelper.verticalSpace(12.h),

                        Text(
                          'Date of birth',
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
                            child: Image.asset(
                              Assets
                                  .images
                                  .dateOfBirthIconDateOfBirthIconTransparent11563206066kwsyxdavui
                                  .path,
                              height: 24.sp,
                              width: 24.sp,
                            ),
                          ),
                          controller: TextEditingController(
                              text: DateFormat('yyyy-MM-dd').format(
                                  userData.dateOfBirth?.toLocal() ??
                                      DateTime.now())),
                          hintText: '',
                        ),
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                })),
      ),
    );
  }
}
