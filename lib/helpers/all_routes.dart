// ignore_for_file: unreachable_switch_case

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:genzeh911/features/account_and_setting/presentation/faq_screen.dart';
import 'package:genzeh911/features/account_and_setting/presentation/notification_screeen.dart';
import 'package:genzeh911/features/account_and_setting/presentation/personal_info_screen.dart';
import 'package:genzeh911/features/auth/forgot_password/presentation/forgot_password_screen.dart';
import 'package:genzeh911/features/auth/otp_verification/presentation/otp_verification_screen.dart';
import 'package:genzeh911/features/auth/sign_in/presentation/sign_in_screen.dart';
import 'package:genzeh911/features/history/presentation/history_details.dart';
import 'package:genzeh911/features/insight/presentation/insight_details.dart';
import 'package:genzeh911/features/quick_scan/presentation/quick_scan_screen.dart';
import 'package:genzeh911/features/subscription_plan/presentation/congratulation_screen.dart';
import 'package:genzeh911/features/subscription_plan/presentation/process_payment_screen.dart';
import 'package:genzeh911/features/subscription_plan/presentation/subscription_plan_screen.dart';
import 'package:genzeh911/navigation_screen.dart';
import '../loading.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String loadingScreen = '/Loading';
  static const String loginSwapScreen = '/loginSwapScreen';
  static const String signInScreen = '/signInScreen';
  // static const String signUpScreen = '/signUpScreen';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerificationScreen = '/forgetPasswordScreen';
  static const String bottomNav = '/bottomNav';
  static const String insightDetailsScreen = '/insightDetailsScreen';
  static const String personalInfoScreen = '/personalInfoScreen';
  static const String historyDetails = '/historyDetails';
  static const String notificationScreeen = '/notificationScreeen';
  static const String faqScreen = '/faqScreen';
  static const String quickScanScreen = '/quickScanScreen';
  static const String subscriptionPlanScreen = '/subscriptionPlanScreen';
  static const String processPaymentScreen = '/processPaymentScreen';
  static const String congratulationScreen = '/congratulationScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loadingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: const Loading(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const Loading());

      case Routes.signInScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const SignInScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => const SignInScreen());

      // case Routes.signUpScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const SignUpScreen(), settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const SignUpScreen());

      case Routes.forgetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ForgotPasswordScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgotPasswordScreen());

      case Routes.otpVerificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const OtpVerificationScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const OtpVerificationScreen());

      case Routes.insightDetailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const InsightDetailsScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const InsightDetailsScreen());

      case Routes.personalInfoScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const PersonalInfoScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PersonalInfoScreen());
      case Routes.historyDetails:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: HistoryDetails(), settings: settings)
            : CupertinoPageRoute(builder: (context) => HistoryDetails());

      case Routes.notificationScreeen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: NotificationScreeen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => NotificationScreeen());

      case Routes.faqScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(widget: FaqScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => FaqScreen());

      case Routes.quickScanScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: QuickScanScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => QuickScanScreen());

      case Routes.subscriptionPlanScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: SubscriptionPlanScreen(), settings: settings)
            : CupertinoPageRoute(
                builder: (context) => SubscriptionPlanScreen());

      case Routes.processPaymentScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ProcessPaymentScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => ProcessPaymentScreen());

      case Routes.congratulationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: CongratulationScreen(), settings: settings)
            : CupertinoPageRoute(builder: (context) => CongratulationScreen());

      case Routes.bottomNav:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: BottomNavBar(
                  pageNum: args["pageNum"],
                ),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => BottomNavBar(
                      pageNum: args["pageNum"],
                    ));

      // case Routes.onboardingPageEleven:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const OnboardingPageEleven(), settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const OnboardingPageEleven());

      default:
        return null;
    }
  }
}

//  weenAnimationBuilder(
//   child: Widget,
//   tween: Tween<double>(begin: 0, end: 1),
//   duration: Duration(milliseconds: 1000),
//   curve: Curves.bounceIn,
//   builder: (BuildContext context, double _val, Widget child) {
//     return Opacity(
//       opacity: _val,
//       child: Padding(
//         padding: EdgeInsets.only(top: _val * 50),
//         child: child
//       ),
//     );
//   },
// );

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
