import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/dynamic_status_bar_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicStatusBarWidget(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              Assets.images.splashScreen.path,
              fit: BoxFit.cover,
            )),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BYE,\nMICROPLASTICS\nAI",
                    style: TextFontStyle.textStyle24c222222QuandoW400
                        .copyWith(letterSpacing: -0.48.sp),
                  ),
                  UIHelper.verticalSpace(13.h),
                  Text(
                    "Unmask Hidden Microplastics in Your\nEveryday Products. Empower Your Choices.\nProtect Your Health and The Environment.",
                    style: TextFontStyle.textStyle16c4D4D4DOpenSansW400,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
