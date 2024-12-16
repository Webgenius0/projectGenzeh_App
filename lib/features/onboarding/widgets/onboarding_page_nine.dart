import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

import '../../../../helpers/ui_helpers.dart';

class OnboardingPageNine extends StatefulWidget {
  final String title;

  const OnboardingPageNine({
    super.key,
    required this.title,
  });

  @override
  State<OnboardingPageNine> createState() => _OnboardingPageNineState();
}

class _OnboardingPageNineState extends State<OnboardingPageNine> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'Prevent Long-Term Chronic Conditions',
      'Promote Reproductive Health',
      'Support Detoxification and Body Health',
      'Improve Skin and Respiratory Health',
      'Educate on Product Safety',
      'Reduce Personal use of Plastics'
          'Through a Friedn',
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UIHelper.verticalSpace(34.h),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextFontStyle.textStyle24c222222QuandoW400
                  .copyWith(letterSpacing: -0.48.sp, color: AppColors.c000000),
            ),
            UIHelper.verticalSpace(42.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(options.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomButton(
                    text: options[index],
                    isSelected: selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
