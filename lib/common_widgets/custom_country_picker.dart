import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// Custom TextFormField
class CustomCountryPicker extends StatefulWidget {
  final TextEditingController textEditingController;
  const CustomCountryPicker({
    super.key,
    required this.textEditingController,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomCountryPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: AppColors.c55d0ff.withOpacity(0.1), // Background color
        borderRadius: BorderRadius.circular(8.r), // Rounded corners
      ),
      child: IntlPhoneField(
        controller: widget.textEditingController,
        dropdownTextStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            hintText: "Enetr Your Phone Number",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 10.h)),
        initialCountryCode: 'BD',
      ),
    );
  }
}
