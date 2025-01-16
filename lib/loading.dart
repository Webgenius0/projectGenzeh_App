import 'package:flutter/material.dart';
import 'package:genzeh911/constants/app_constants.dart';
import 'package:genzeh911/features/auth/sign_in/presentation/sign_in_screen.dart';
import 'package:genzeh911/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:genzeh911/features/onboarding/presentation/onboarding_screen.dart';
import 'package:genzeh911/helpers/di.dart';
import 'package:genzeh911/helpers/helper_methods.dart';
import 'package:genzeh911/navigation_screen.dart';
import 'package:genzeh911/networks/dio/dio.dart';
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
    await setInitValue();
    bool data = appData.read(kKeyIsLoggedIn) ?? false;
    if (data) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      bool data = appData.read(kKeyIsLoggedIn) ?? false;

      return appData.read(kKeyfirstTime)
          ? OnBoardingScreen()
          : data
              ? BottomNavBar(pageNum: 0)
              : SignInScreen();
    }
  }
}
