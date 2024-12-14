import 'package:flutter/material.dart';
import 'package:genzeh911/features/onboarding/onboarding_screen.dart';
import 'package:genzeh911/helpers/helper_methods.dart';
import 'package:genzeh911/splash_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return const OnBoardingScreen();
    }
  }
}
