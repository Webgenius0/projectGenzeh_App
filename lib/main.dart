// ignore_for_file: deprecated_member_use
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/features/home/presentation/home_screen.dart';
import 'package:genzeh911/features/notification/presentation/notification_screen.dart';
import 'package:genzeh911/features/profile/presentation/profile_screen.dart';
import 'package:genzeh911/features/subscription_plan/presentation/subscription_plan_screen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/di.dart';
import 'package:genzeh911/helpers/register_provider.dart';
import 'package:genzeh911/loading.dart';
import 'package:genzeh911/networks/dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'helpers/helper_methods.dart';
import 'helpers/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await _requestPermissions();
  await GetStorage.init();
  diSetup();
  // initiInternetChecker();

  DioSingleton.instance.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: const Duration(milliseconds: 150),
        child: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const UtillScreenMobile();
            },
          ),
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
            canPop: false,
            onPopInvokedWithResult: (bool didPop, _) async {
              showMaterialDialog(context);
            },
            child: GetMaterialApp(
                //    showPerformanceOverlay: true,
                theme: ThemeData(
                    unselectedWidgetColor: Colors.white,
                    useMaterial3: false,
                    scaffoldBackgroundColor: AppColors.cFFFFFF,
                    appBarTheme: const AppBarTheme(
                        color: AppColors.cFFFFFF, elevation: 0)),
                debugShowCheckedModeBanner: false,
                builder: (context, widget) {
                  return MediaQuery(
                      data: MediaQuery.of(context), child: widget!);
                },
                navigatorKey: NavigationService.navigatorKey,
                onGenerateRoute: RouteGenerator.generateRoute,
                home: ProfileScreen()));
      },
    );
  }
}
