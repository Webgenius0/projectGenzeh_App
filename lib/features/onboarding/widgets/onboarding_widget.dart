import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/dynamic_status_bar_widget.dart';
import 'package:genzeh911/common_widgets/stepper_bar.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_eleven.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_five.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_four.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_nine.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_one.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_seven.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_six.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_ten.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_three.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_twelve.dart';
import 'package:genzeh911/features/onboarding/widgets/onboarding_page_two.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/provider/page_view_provider.dart';
import 'package:provider/provider.dart';
import '../../../../gen/assets.gen.dart';

class OnBoardingWidget extends StatefulWidget {
  final Function() onDone;

  const OnBoardingWidget({super.key, required this.onDone});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _currentIndex = 0;
  final int totalSteps = 11;

  @override
  void initState() {
    super.initState();
    context.read<PageViewProvider>().controller.addListener(() {
      setState(() {
        _currentIndex =
            context.read<PageViewProvider>().controller.page!.round();
      });
    });
  }

  double calculatePerformanceBarWidth() {
    return (_currentIndex / totalSteps) * 100; // Returns percentage width
  }

  @override
  Widget build(BuildContext context) {
    return DynamicStatusBarWidget(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       NavigationService.goBack;
        //     },
        //     icon: Padding(
        //       padding: const EdgeInsets.all(10.0),
        //       child: SvgPicture.asset(
        //         Assets.icons.arrowBack,
        //         height: 24.h,
        //         width: 24.w,
        //       ),
        //     ),
        //   ),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
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
                  UIHelper.verticalSpace(70.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // if (_currentIndex != -0) Container(),
                      // UIHelper.horizontalSpace(115.w),
                      PerformanceBar(
                        fillColor:
                            AppColors.c3689FD, // You can choose any color
                        width: calculatePerformanceBarWidth(),
                      ),
                    ],
                  ),
                  Flexible(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      // scrollBehavior: ScrollBehavior,
                      allowImplicitScrolling: false,
                      controller: context.read<PageViewProvider>().controller,
                      children: const [
                        OnboardingPageOne(
                          title: 'How Old Are You?',
                          description: '',
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
                          title: 'SCAN GET AI \nANALYSIS RECOMMENDATIONS',
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
                        OnboardingPageSeven(
                          title: 'MicroPlastics are Harmful to Our Health',
                          descriptionOne:
                              'Microplastics can be found in the maternal and fetal sides of the placenta, as well as in the amniochorial membranes.',
                          descriptionTwo:
                              'A study found microplastics in the blood samples of 77% individuals. Microplastics can circulate through the body, lodging in organs and affecting their function over time.',
                        ),
                        OnboardingPageNine(title: 'What is your main goal?'),
                        OnboardingPageTen(
                          titleOne: 'Welcome to ',
                          titleTwo: ' BMAi',
                          icon: '👋',
                          description:
                              'Your AI-powered Agent Helping You Detect Microplastic Ingredients in Personal And Household Products. A Must Have in Your Path to Longevity.',
                        ),
                        OnboardingPageEleven(
                          title: 'Complete Your Profile',
                          description:
                              'Don\'t worry, only you can see your personal data.',
                        ),
                        OnboardingPageTwelve(),
                      ],
                    ),
                  ),
                  _currentIndex == 8
                      ? SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp),
                          child: _currentIndex == totalSteps - 1
                              ? const SizedBox.shrink()
                              : customElevatedButton(
                                  onPressed: () {
                                    if (_currentIndex == totalSteps - 1) {
                                      widget.onDone();
                                    } else {
                                      context
                                          .read<PageViewProvider>()
                                          .controller
                                          .nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.linear,
                                          );
                                    }
                                  },
                                  child: Text(
                                    'Continue',
                                    style: TextFontStyle
                                        .textStyle14c252C2EOpenSansW400
                                        .copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.cFFFFFF,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  bgColor: AppColors.allPrimaryColor),
                        ),
                  UIHelper.verticalSpace(48.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
