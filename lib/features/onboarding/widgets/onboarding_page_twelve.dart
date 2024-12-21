import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class OnboardingPageTwelve extends StatefulWidget {
  const OnboardingPageTwelve({super.key});

  @override
  State<OnboardingPageTwelve> createState() => _OnboardingPageTwelveState();
}

class _OnboardingPageTwelveState extends State<OnboardingPageTwelve> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(52.h),
          Text(
            "Create an Account.",
            style: TextFontStyle.textStyle24c222222UrbanistW600
                .copyWith(letterSpacing: -0.5.sp, color: AppColors.c000000),
          ),
          UIHelper.verticalSpace(16.h),
          Text(
            "Please enter your username, email and password.",
            style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
              color: AppColors.c4B586B,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          UIHelper.verticalSpace(24.h),
          CustomInputFieldWidget(
            labelText: "Username",
            isPasswordField: false,
            showSuffixIcon: false,
            hintText: 'Enter username',
            inputType: TextInputType.name,
            controller: nameController,
          ),
          UIHelper.verticalSpace(20.h),
          CustomInputFieldWidget(
            labelText: "Email",
            isPasswordField: false,
            showSuffixIcon: false,
            hintText: 'Enter email',
            inputType: TextInputType.emailAddress,
            controller: emailController,
          ),
          UIHelper.verticalSpace(20.h),
          CustomInputFieldWidget(
            labelText: "Password",
            isPasswordField: true,
            showSuffixIcon: true,
            hintText: 'Enter password',
            inputType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
          UIHelper.verticalSpace(20.h),
          CustomInputFieldWidget(
            labelText: "Confirm Password",
            isPasswordField: true,
            showSuffixIcon: true,
            hintText: 'Re enter password',
            inputType: TextInputType.visiblePassword,
            controller: confirmPasswordController,
          ),
          UIHelper.verticalSpace(16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RememberMeCheckbox(),
              // TextButton(
              //     onPressed: () {
              //       NavigationService.navigateTo(Routes.forgetPasswordScreen);
              //     },
              //     child: Text(
              //       'Forgot password?',
              //       style: TextFontStyle.textStyle24c222222UrbanistW600
              //           .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
              //     ))
            ],
          ),

          UIHelper.verticalSpace(12.h),
          customElevatedButton(
              onPressed: () {
                NavigationService.navigateTo(Routes.subscriptionPlanScreen);
              },
              child: Text(
                'Continue',
                style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.cFFFFFF,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bgColor: AppColors.allPrimaryColor),
          //     ,
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
