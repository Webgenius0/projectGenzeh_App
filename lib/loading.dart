import 'package:flutter/material.dart';
import 'package:genzeh911/features/onboarding/presentation/onboarding_screen.dart';
import 'package:genzeh911/splash_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;
  // bool isFirstTime = true;

  @override
  void initState() {
    loadInitialData();

    super.initState();
  }

  loadInitialData() async {
    _isLoading = true;
    //AutoAppUpdateUtil.instance.checkAppUpdate();
    // await setInitValue();
    await Future.delayed(Duration(
      seconds: 1,
    ));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return OnBoardingScreen();
    }
  }
}
