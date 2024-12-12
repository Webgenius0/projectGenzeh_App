import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/helpers/navigation_service.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              Assets.images.splashScreen.path,
              fit: BoxFit.cover,
            ),
          ),

          // Back Button Icon
          Positioned(
            top: MediaQuery.of(context).padding.top +
                38.h, // Adjusted for status bar
            left: 20.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.icons.arrowBack,
                width: 18.w,
                height: 7.5.w,
                color: AppColors.c000000,
              ),
            ),
          ),

          Align(
            alignment:
                Alignment.topCenter, // Aligns the content at the top center
            child: Padding(
              padding:
                  EdgeInsets.only(top: 200.h), // Adjust top padding as needed
              child: Column(
                mainAxisSize: MainAxisSize.min, // Keeps the column compact
                children: [
                  Text("How Old Are You?",
                      style: TextFontStyle.testStyle24c000000QuandoW400),
                  SizedBox(height: 10.h), // Adds spacing between texts
                  Text("Select your age range for better content.",
                      textAlign: TextAlign.center,
                      style: TextFontStyle.textStyle14c252C2EOpenSansW400),
                  SizedBox(height: 10.h), // Adds spacing between texts
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
