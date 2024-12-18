import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  Color? textColor;
  PasswordTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.textColor = AppColors.c0A3004,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscure = true; // Initial state: password is obscured.

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null; // Return null if the input is valid
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        hintText: widget.hintText,
        hintStyle: TextFontStyle.textStyle16c4D4D4DOpenSansW400.copyWith(
            color: widget.textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.c0D95F6,
              width: 1.w), // Replace with your custom color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.c0D95F6,
              width: 1.w), // Replace with your custom color
        ),

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: BorderSide(
              color: AppColors.c0D95F6,
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
        // Suffix icon for toggle

        prefixIcon: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: SvgPicture.asset(
            'assets/icons/password.svg',
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure; // Toggle the obscureText state
            });
          },
        ),
      ),
    );
  }
}
