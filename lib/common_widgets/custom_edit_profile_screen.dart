import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

import '../helpers/ui_helpers.dart';

class CustomEditProfileScreen extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Widget suffixIcon;

  const CustomEditProfileScreen({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextFontStyle.textStyle14c252C2EOpenSansW400
              .copyWith(color: AppColors.c0A3004),
        ),
        UIHelper.verticalSpace(14.h),
        TextFormField(
            decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
          ),
          fillColor: AppColors.c0A3004,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
              borderSide: BorderSide(width: 0.1, color: AppColors.cC4C4C4)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: AppColors.allPrimaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: AppColors.c0A3004,
              width: 1.0,
            ),
          ),
        )),
      ],
    );
  }
}
