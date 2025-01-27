import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/networks/api_acess.dart';
import 'package:genzeh911/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpTwoScreen extends StatefulWidget {
  const SignUpTwoScreen({
    super.key,
  });

  @override
  State<SignUpTwoScreen> createState() => _SignUpTwoScreenState();
}

class _SignUpTwoScreenState extends State<SignUpTwoScreen> {
  int selectedIndex = -1;
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.images.splashScreen.path,
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UIHelper.verticalSpace(52.h),
                    Text(
                      "Create an Account.",
                      style: TextFontStyle.textStyle24c222222UrbanistW600
                          .copyWith(
                              letterSpacing: -0.5.sp, color: AppColors.c000000),
                    ),
                    UIHelper.verticalSpace(16.h),
                    Center(
                      child: Text(
                        "Enter your username, email and password.If you forget return to the forgot password screen ",
                        style: TextFontStyle.textStyle24c222222UrbanistW600
                            .copyWith(
                          color: AppColors.c4B586B,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    CustomInputFieldWidget(
                      labelText: "Username",
                      isPasswordField: false,
                      showSuffixIcon: false,
                      hintText: 'Enter username',
                      inputType: TextInputType.name,
                      controller: context.read<AuthProvider>().username,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your username";
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(20.h),
                    CustomInputFieldWidget(
                      labelText: "Email",
                      isPasswordField: false,
                      showSuffixIcon: false,
                      hintText: 'Enter email',
                      inputType: TextInputType.emailAddress,
                      controller: context.read<AuthProvider>().email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(20.h),
                    CustomInputFieldWidget(
                      labelText: "Password",
                      isPasswordField: true,
                      showSuffixIcon: true,
                      hintText: 'Enter password',
                      inputType: TextInputType.visiblePassword,
                      controller: context.read<AuthProvider>().password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        return null;
                      },
                    ),
                    UIHelper.verticalSpace(20.h),
                    CustomInputFieldWidget(
                      labelText: "Confirm Password",
                      isPasswordField: true,
                      showSuffixIcon: true,
                      hintText: 'Re enter password',
                      inputType: TextInputType.visiblePassword,
                      controller: context.read<AuthProvider>().confirmpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (value !=
                            context.read<AuthProvider>().password.text.trim()) {
                          return "Both password's are not matched";
                        }
                        return null;
                      },
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
                    UIHelper.verticalSpace(45.h),
                    ValueListenableBuilder(
                        valueListenable: isLoading,
                        builder: (context, bool, widget) {
                          return !isLoading.value
                              ? customElevatedButton(
                                  onPressed: () {
                                    _signUpMethod();
                                  },
                                  child: Text(
                                    !isLoading.value
                                        ? 'Continue'
                                        : "Loading....",
                                    style: TextFontStyle
                                        .textStyle24c222222UrbanistW600
                                        .copyWith(
                                      fontSize: 16.sp,
                                      color: AppColors.cFFFFFF,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  bgColor: AppColors.allPrimaryColor)
                              : Center(
                                  child: CircularProgressIndicator(),
                                );
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUpMethod() async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    if (provider.isChecked) {
      if (formKey.currentState?.validate() ?? false) {
        File imageFile =
            File(provider.imageFileNotifier.value!); // Now this will be safe

        // Loading Start's
        isLoading.value = true;
        // NavigationService.navigateTo(Routes.setUserName);

        await signupRx
            .signup(
                name: provider.name.text.trim(),
                dateofbirth: provider.displayedHintText2.toString(),
                country: provider.selectedCountry.toString(),
                username: provider.username.text.trim(),
                email: provider.email.text.trim(),
                image: imageFile,
                password: provider.password.text.trim())
            .then((succcess) {
          isLoading.value = false;

          if (succcess) {
            NavigationService.navigateTo(
              Routes.subscriptionPlanScreen,
            );
          }
        }, onError: (error) {
          isLoading.value = false;
          ToastUtil.showShortToast(error);
          return null;
        });
      } else {
        isLoading.value = false;
      }
    } else {
      isLoading.value = false;
      ToastUtil.showShortToast('Plese Agree Our Terms & Conditions');
    }
  }
}

class RememberMeCheckbox extends StatefulWidget {
  final Function(bool)? onChanged;

  const RememberMeCheckbox({super.key, this.onChanged});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer<AuthProvider>(builder: (context, provider, widget) {
          return Transform.scale(
            scale: 1.4,
            child: Theme(
              data: ThemeData(
                visualDensity: VisualDensity.compact,
              ),
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: provider.isChecked,
                onChanged: (bool? value) {
                  provider.toogleCheck(value!);

                  log("${provider.isChecked}");
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
          );
        }),
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
