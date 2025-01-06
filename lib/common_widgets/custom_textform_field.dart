// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/text_font_style.dart';
import '../gen/colors.gen.dart';

class YogaCustomTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  // final int maxline

  final int? maxline;
  final bool readOnly;
  final bool? isBorder;
  final Color fillColor;
  final String? prefixImage;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Function()? onTap;

  const YogaCustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 10.0, // Set to 10 pixels
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline,
    this.isBorder = false,
    this.fillColor = AppColors.cF4F5F7,
    this.prefixImage,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.onTap,
  });

  @override
  _YogaCustomTextFormFieldState createState() =>
      _YogaCustomTextFormFieldState();
}

class _YogaCustomTextFormFieldState extends State<YogaCustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        // isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5.h,
        horizontal: 5.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5.w,
          color: AppColors.cEBEBEB,
        ),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
        color: AppColors.cffffff,
      ),
      child: TextFormField(
        onTap: widget.onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLength: widget.maxLength,
        showCursor: true,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        readOnly: widget.readOnly,
        maxLines: widget.maxline ?? 1,
        focusNode: _focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          // filled: true,
          border: InputBorder.none,
          // fillColor: widget.fillColor,
          labelText: widget.labelText,
          hintText: widget.hintText,
          // contentPadding: EdgeInsets.symmetric(
          //   vertical: 12.h,
          // ),
          // hintStyle: TextFontStyle.headline14w400C848484Stylejost,

          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5),
          hintStyle: widget.isPrefixIcon == false
              ? TextFontStyle.textStyle12c0A3004PoppinsW500
                  .copyWith(color: AppColors.c757575)
              : TextFontStyle.textStyle12c0A3004PoppinsW500,
          prefixIcon: widget.isPrefixIcon && widget.prefixImage != null
              ? Container(
                  height: 46.h,
                  width: 51.w,
                  margin: EdgeInsets.only(right: 11.w),
                  padding: EdgeInsets.all(11.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.cFFEAB5,
                  ),
                  child: SvgPicture.asset(
                    widget.prefixImage ?? "",
                    height: 18.h,
                    width: 20.w,
                  ),
                )
              : null,
          suffixIcon: widget.suffixIcon != null
              ? GestureDetector(
                  onTap: widget.onSuffixIconTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Icon(
                      widget.suffixIcon,
                      color: _isFocused
                          ? AppColors.allPrimaryColor
                          : AppColors.cB3BAC5,
                    ),
                  ),
                )
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
