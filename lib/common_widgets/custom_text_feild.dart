import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

// Custom TextFormField
class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool isPrefixIcon;
  final bool readOnly;

  const CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.isPrefixIcon = false,
    this.readOnly = false,
    super.key,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.all(14.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.c55d0ff.withOpacity(0.1), // Background color
        borderRadius: BorderRadius.circular(8.r), // Rounded corners
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.5.h),
          prefixIcon: widget.isPrefixIcon ? widget.prefixIcon : null,
          hintText: widget.hintText,
          hintStyle: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
            color: AppColors.c545A63,
            fontSize: 15.sp,
            letterSpacing: -0.32.sp,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none, // No visible border
        ),
      ),
    );
  }
}
