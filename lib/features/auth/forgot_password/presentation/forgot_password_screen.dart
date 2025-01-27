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
import 'package:genzeh911/networks/api_acess.dart';
import '../../../../common_widgets/custom_elevated_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

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
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        style: TextFontStyle.textStyle24c222222UrbanistW600
                            .copyWith(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your valid email";
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(24.h),
                    const Spacer(),
                    customElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState?.validate() ?? false) {
                            otpSendRx
                                .otpSend(email: emailController.text.trim())
                                .then((success) {
                              if (success) {
                                NavigationService.navigateTo(
                                    Routes.otpVerificationScreen);
                              }
                            });
                          }
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
            ),
          )
        ],
      ),
    );
  }
}
