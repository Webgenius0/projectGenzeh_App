import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

class CustomChangePasswordWidget extends StatefulWidget {
  final String hintText;

  const CustomChangePasswordWidget({Key? key, required this.hintText})
      : super(key: key);

  @override
  _CustomChangePasswordWidgetState createState() =>
      _CustomChangePasswordWidgetState();
}

class _CustomChangePasswordWidgetState
    extends State<CustomChangePasswordWidget> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.c212121,
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextFontStyle.textStyle16c4D4D4DUrbanistW400.copyWith(
          color: AppColors.c0A3004,
          fontSize: 12.sp,
        ), // Hint text color
        filled: true,
        fillColor: Colors.white, // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r), // Rounded corners
          borderSide: BorderSide(
            color: AppColors.c222222, // Border color
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.c222222, // Border color when not focused
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.allPrimaryColor, // Border color when focused
            width: 1.0,
          ),
        ),
        suffixIcon: IconButton(
          iconSize: 20.sp,
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey, // Icon color
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        ),
      ),
    );
  }
}
