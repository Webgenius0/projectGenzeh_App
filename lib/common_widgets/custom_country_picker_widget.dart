// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:country_picker/country_picker.dart';

class CustomBirthDayAndCountryPickWidget extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool showSuffixIcon;
  final String? suffixIcon;
  final VoidCallback onButtonPressed;
  // Callback when button is pressed
  final bool isDatePicker;

  const CustomBirthDayAndCountryPickWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.showSuffixIcon = true,
    required this.onButtonPressed, // Callback
    required this.isDatePicker,
  });

  @override
  State<CustomBirthDayAndCountryPickWidget> createState() =>
      _CustomDateOrCountryPickWidgetState();
}

class _CustomDateOrCountryPickWidgetState
    extends State<CustomBirthDayAndCountryPickWidget> {
  bool isIconVisible = false; // To manage dynamic icon display
  bool isDateSelected = false;

  @override
  void initState() {
    super.initState();
    context.read<AuthProvider>().displayedHintText = widget.hintText;
  }

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
        ElevatedButton(
          onPressed: () async {
            if (widget.isDatePicker) {
              await selectDate(context); // Show the DatePicker
            } else {
              showCountryPicker(
                context: context,
                showPhoneCode:
                    true, // optional. Shows phone code next to the country name.
                onSelect: (Country country) {
                  setState(() {
                    context.read<AuthProvider>().selectedCountry =
                        '${country.name}';
                  });
                },
              );
            }
            if (widget.onButtonPressed != null) {
              widget.onButtonPressed(); // Trigger the callback if provided
            }
            setState(() {
              isIconVisible =
                  !isIconVisible; // Toggle the icon state (optional)
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // Transparent background
            padding: EdgeInsets.all(15.sp), // Padding of 14 pixels on all sides
            elevation: 0,
            shadowColor: Colors.transparent, // Remove shadow if desired
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(4.r), // Optional rounded corners
              side: BorderSide(
                width: 1.sp,
                color: AppColors.c3689FD, // Border color
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.isDatePicker
                      ? context.read<AuthProvider>().displayedHintText
                      : context
                          .read<AuthProvider>()
                          .selectedCountry
                          .toLowerCase(),
                  style: TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                    color: AppColors.c4B586B, // Text color
                    fontSize: 14.sp,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis, // In case text overflows
                ),
              ),
              Container(
                  height: 24.h,
                  width: 24.w,
                  child: SvgPicture.asset(
                    widget.suffixIcon!,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        // Format the date to display in the widget
        context.read<AuthProvider>().displayedHintText =
            "${selectedDate.toLocal()}".split(' ')[0];
        isDateSelected = true;
      });
    }
  }
}
