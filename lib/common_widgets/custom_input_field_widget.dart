import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class CustomInputFieldWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool isPasswordField;
  final bool showSuffixIcon;
  final TextInputType inputType;
  final TextEditingController? controller;

  const CustomInputFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
    this.showSuffixIcon = true,
    this.inputType = TextInputType.text,
    this.controller,
  });

  @override
  State<CustomInputFieldWidget> createState() => _CustomInputFieldWidgetState();
}

class _CustomInputFieldWidgetState extends State<CustomInputFieldWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
            color: AppColors.c212121,
            fontSize: 14.sp,
          ),
        ),
        UIHelper.verticalSpace(12.h),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasswordField && !isPasswordVisible,
          keyboardType: widget.inputType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextFontStyle.textStyle14c252C2EOpenSansW400
                .copyWith(color: AppColors.c4B586B),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.c3689FD, // Default border color
                width: 1, // Border width
              ),
              borderRadius:
                  BorderRadius.circular(4.0.r), // Optional rounded border
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.c3689FD, // Border color when focused
                width: 1, // Border width when focused
              ),
              borderRadius: BorderRadius.circular(4.0.r),
            ),
            suffixIcon: widget.showSuffixIcon
                ? widget.isPasswordField
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      )
                    : null
                : null,
          ),
        ),
      ],
    );
  }
}
