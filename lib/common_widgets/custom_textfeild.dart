import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import '../gen/colors.gen.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String? hintText;
  final TextEditingController controller;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool isSuffixIcon;
  bool isPrefixIcon;
  // bool isEnabled;
  Color? textColor;
  bool isObSecure;
  int? maxLines;
  Function(String)? onFieldSubmitted;
  Function(String?)? onSaved;

  CustomTextFormField({
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.isPrefixIcon,
    this.suffixIcon,
    this.textColor = AppColors.c0A3004,
    this.isSuffixIcon = false,
    // this.isEnabled = true,
    this.isObSecure = false,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.onSaved,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // textAlign: TextAlign.center,

      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLines: widget.maxLines,
      controller: widget.controller,
      obscureText: widget.isObSecure,
      decoration: InputDecoration(
        prefixIcon: widget.isPrefixIcon ? widget.prefixIcon : null,
        suffixIcon: widget.isSuffixIcon ? widget.suffixIcon : null,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        hintText: widget.hintText,
        hintStyle: TextFontStyle.textStyle14c54585CDmSans400.copyWith(
            color: widget.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.allPrimaryColor,
              width: 1.w), // Replace with your custom color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.c0A3004,
              width: 1.w), // Replace with your custom color
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.c0A3004,
              width: 1.w), // Replace with your custom color
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
      ),
    );
  }
}
