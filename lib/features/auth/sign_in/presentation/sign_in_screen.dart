import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

import '../../../../common_widgets/custom_elevated_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController nameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int selectedIndex = -1;

  final List<Map<String, dynamic>> signInOption = [
    {
      'icon': Assets.icons.apple,
      'title': 'Continue With Apple',
    },
    {
      'icon': Assets.icons.google,
      'title': 'Continue with Google',
    },
    // {
    //   'icon': null,
    //   'title': 'Other Email',
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            Assets.images.splashScreen.path,
            fit: BoxFit.cover,
          )),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(55.h),
                    Text(
                      "Hello there 👋",
                      style: TextFontStyle.textStyle24c222222UrbanistW600
                          .copyWith(
                              letterSpacing: -0.48.sp,
                              color: AppColors.c000000),
                    ),
                    UIHelper.verticalSpace(10.h),
                    Text(
                      "Please enter your username/email and \npassword to sign in",
                      style:
                          TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                        color: AppColors.c4B586B,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    UIHelper.verticalSpace(15.h),
                    CustomInputFieldWidget(
                      labelText: "Username 0r Email",
                      isPasswordField: false,
                      showSuffixIcon: false,
                      hintText: 'Azizul Hakim',
                      inputType: TextInputType.emailAddress,
                      controller: nameOrEmailController,
                    ),
                    UIHelper.verticalSpace(15.h),
                    CustomInputFieldWidget(
                      labelText: "Password",
                      isPasswordField: true,
                      showSuffixIcon: true,
                      hintText: '******',
                      inputType: TextInputType.text,
                      controller: passwordController,
                    ),
                    UIHelper.verticalSpace(10.h),
                    const RememberMeCheckbox(),
                    UIHelper.verticalSpace(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => NavigationService.navigateTo(
                              Routes.forgetPasswordScreen),
                          child: Text("Forgot Password",
                              style: TextFontStyle
                                  .textStyle24c222222UrbanistW600
                                  .copyWith(
                                      fontSize: 18.sp,
                                      color: AppColors.c222222)),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withOpacity(0.5),
                            thickness: 1,
                            indent: 6,
                            endIndent: 6,
                          ),
                        ),

                        // Text in the center
                        Text(
                          'or continue with',
                          style: TextFontStyle.textStyle24c222222UrbanistW600
                              .copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.c222222.withOpacity(0.4),
                            fontSize: 12.sp,
                          ),
                        ),

                        // Right Divider
                        Expanded(
                          child: Divider(
                            color:
                                Colors.grey.withOpacity(0.5), // Divider color
                            thickness: 1,
                            indent: 6,
                            endIndent: 6,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(17.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(signInOption.length, (index) {
                        final option = signInOption[index];
                        return CustomButton(
                          text: option['title'],
                          loginIcon: option['icon'],
                          isSelected: selectedIndex == index,
                          backgroundColor: selectedIndex == index
                              ? AppColors.c3689FD // Selected button background
                              : Colors.transparent, // Default background
                          textColor: selectedIndex == index
                              ? Colors.white // Selected button text color
                              : AppColors.c252C2E, // Default text color
                          onPressed: () {
                            if (index == signInOption.length - 1) {
                              // NavigationService.navigateTo(Routes.signInScreen);
                            } else if (index == signInOption.length - 2) {
                              // NavigationService.navigateTo(Routes.signUpScreen);
                            } else {
                              setState(() {
                                selectedIndex = index;
                              });
                            }
                          },
                        );
                      }),
                    ),
                    UIHelper.verticalSpace(18.h),
                    customElevatedButton(
                        onPressed: () {
                          NavigationService.navigateToWithArgs(
                              Routes.bottomNav, {"pageNum": 0});
                        },
                        child: Text(
                          'Sign In',
                          style: TextFontStyle.textStyle24c222222UrbanistW600
                              .copyWith(
                            fontSize: 16.sp,
                            color: AppColors.cFFFFFF,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        bgColor: AppColors.allPrimaryColor),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RememberMeCheckbox extends StatefulWidget {
  final Function(bool)? onChanged;

  const RememberMeCheckbox({super.key, this.onChanged});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
          scale: 1.4,
          child: Theme(
            data: ThemeData(
              visualDensity: VisualDensity.compact,
            ),
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value ?? false;
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(isChecked);
                }
              },
              activeColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              side: const BorderSide(
                color: Colors.black54,
              ),
            ),
          ),
        ),
        UIHelper.horizontalSpace(6.w), // Add spacing
        // Label
        Text("Remember me",
            style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.c222222.withOpacity(0.6))),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final String? loginIcon;
  final VoidCallback onPressed;
  final Color? backgroundColor; // Dynamic background color
  final Color? textColor; // Dynamic text color
  final double? width;

  const CustomButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.loginIcon,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Container(
          height: 56.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
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
                  color: textColor ?? AppColors.c222222,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
