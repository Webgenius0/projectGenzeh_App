import 'package:flutter/material.dart';
import 'package:genzeh911/common_widgets/dynamic_status_bar_widget.dart';
import 'package:genzeh911/constants/app_constants.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_widget.dart';
import 'package:genzeh911/helpers/di.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    appData.write(kKeyfirstTime, false);
    return DynamicStatusBarWidget(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      child: Scaffold(
          body: Stack(
        children: [
          OnBoardingWidget(onDone: () {}),
        ],
      )),
    );
  }
}
