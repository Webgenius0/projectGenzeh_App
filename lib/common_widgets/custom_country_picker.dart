import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// Custom TextFormField
class CustomCountryPicker extends StatefulWidget {
  const CustomCountryPicker({
    super.key,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomCountryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.all(14.sp),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.c55d0ff.withOpacity(0.1), // Background color
        borderRadius: BorderRadius.circular(8.r), // Rounded corners
      ),
      child: IntlPhoneField(
        dropdownTextStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h)),
        initialCountryCode: 'BD',
      ),
    );
  }
}
