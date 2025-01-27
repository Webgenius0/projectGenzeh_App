// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';
import 'package:genzeh911/provider/edit_profile.dart';
import 'package:provider/provider.dart';

class CustomGenderPicker extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool showSuffixIcon;
  final String? suffixIcon;
  final VoidCallback onButtonPressed;
  // Callback when button is pressed
  final bool isDatePicker;

  const CustomGenderPicker({
    super.key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.showSuffixIcon = true,
    required this.onButtonPressed, // Callback
    required this.isDatePicker,
  });

  @override
  State<CustomGenderPicker> createState() => _CustomGenderPickerState();
}

class _CustomGenderPickerState extends State<CustomGenderPicker> {
  bool isIconVisible = false; // To manage dynamic icon display
  bool isDateSelected = false;
  // String selectedCountry = "";

  @override
  void initState() {
    super.initState();
    context.read<EditProfileProvider>().displayedHintText = widget.hintText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextFontStyle.textStyle24c222222UrbanistW600.copyWith(
              color: AppColors.c212121, fontSize: 16.sp, letterSpacing: -0.32),
        ),
        UIHelper.verticalSpace(12.h),
        ElevatedButton(
          onPressed: () async {
            if (widget.isDatePicker) {
              await selectDate(context); // Show the DatePicker
            } else {
              await selectCountry(context); // Show the Country Picker
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
                  context.read<EditProfileProvider>().displayedHintText,
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
        context.read<EditProfileProvider>().displayedHintText =
            "${selectedDate.toLocal()}".split(' ')[0];
        isDateSelected = true;
      });
    }
  }

  Future<void> selectCountry(BuildContext context) async {
    String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Gender"),
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'male');
                    },
                    child: Text("male"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'female');
                    },
                    child: Text("female"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'others');
                    },
                    child: Text("others"),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );

    if (selected != null) {
      setState(() {
        context.read<EditProfileProvider>().displayedHintText = selected;
      });
      log("${context.read<EditProfileProvider>().displayedHintText}");
    }
  }
}
