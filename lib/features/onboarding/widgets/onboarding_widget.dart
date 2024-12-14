import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_five.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_four.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_nine.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_one.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_six.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_three.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_two.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';

class OnBoardingWidget extends StatefulWidget {
  final Function() onDone;

  const OnBoardingWidget({super.key, required this.onDone});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentIndex = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            Assets.images.splashScreen.path,
            fit: BoxFit.cover,
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                UIHelper.verticalSpace(25.h),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          NavigationService.goBack;
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.c000000,
                        )),
                    SvgPicture.asset(Assets.icons.stepper)
                  ],
                ),
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),

                    // scrollBehavior: ScrollBehavior,
                    allowImplicitScrolling: false,
                    controller: _controller,
                    children: const [
                      OnboardingPageOne(
                        title: 'How Old Are You?',
                        description: 'Select age range for better content.',
                      ),
                      OnboardingPageTwo(
                        title: 'How did you find us?',
                      ),
                      OnboardingPageThree(
                        title: 'Discover Hidden MICROPLASTICS',
                        description:
                            'Powered by AI to Detect Microplastic Ingredients in Cosmetics, Skincare, and Household Products with Precision.',
                      ),
                      OnboardingPageFour(
                        title: 'SCAN GET AI ANALYSIS RECOMMENDATIONS',
                        description:
                            'Our AI technology analyzes products for microplastic content in seconds.',
                      ),
                      OnboardingPageFive(
                        title: 'MicroPlastics are Harmful to Our Health',
                        descriptionOne:
                            'Studies have shown that exposure to microplastics reduced sperm motility and viability by up to 20% in controlled laboratory experiments.',
                        descriptionTwo:
                            'A study detected microplastics in 90% of tested human brain samples, raising concerns about their role in cognitive decline and neurological disorders.',
                      ),
                      OnboardingPageSix(
                        title: 'MicroPlastics are Harmful to Our Health',
                        descriptionOne:
                            'Microplastics can accumulate in lung tissue and potentially impair respiratory health',
                        descriptionTwo:
                            'Microplastics increase the risk of heart disease, stroke, and death.',
                      ),
                      OnboardingPageNine(title: 'What is your main goal?')
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 38.w, right: 38.w, bottom: 53.h),
                  child: customElevatedButton(
                      onPressed: () {
                        if (_currentIndex == 10) {
                          widget.onDone();
                        } else {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        'Continew',
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                          fontSize: 12.sp,
                          color: AppColors.cFFFFFF,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      bgColor: AppColors.allPrimaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
