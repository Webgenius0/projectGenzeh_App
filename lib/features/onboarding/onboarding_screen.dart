import 'package:flutter/material.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_widget.dart';
import 'package:genzeh911/welcome_screen.dart';
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';
import '../../../helpers/di.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    appData.write(kKeyfirstTime, false);
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          OnBoardingWidget(onDone: () {
            Get.to<dynamic>(const WelcomeScreen());
          }),
        ],
      ),
    ));
  }
}
