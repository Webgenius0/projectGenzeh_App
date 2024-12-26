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

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

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
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            Assets.images.splashScreen.path,
            fit: BoxFit.cover,
          )),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password",
                    style: TextFontStyle.textStyle24c222222UrbanistW600
                        .copyWith(
                            letterSpacing: -0.5.sp, color: AppColors.c222222),
                  ),
                  UIHelper.verticalSpace(16.h),
                  Text(
                      "Enter your email address. You Will receive an OTP code for verification via email.",
                      style:
                          TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                        color: AppColors.c4B586B,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center),
                  UIHelper.verticalSpace(24.h),
                  CustomInputFieldWidget(
                    labelText: "Email",
                    isPasswordField: false,
                    showSuffixIcon: false,
                    hintText: 'abc@gmail.com',
                    inputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  UIHelper.verticalSpace(24.h),
                  const Spacer(),
                  customElevatedButton(
                      onPressed: () {
                        // Get.to(() => const OtpVerificationScreen());
                        NavigationService.navigateTo(
                            Routes.otpVerificationScreen);
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
                      bgColor: AppColors.allPrimaryColor),
                  UIHelper.verticalSpace(57.h),
                ],
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
        padding: EdgeInsets.symmetric(vertical: 10.h),
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
