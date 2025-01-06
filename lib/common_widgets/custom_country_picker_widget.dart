// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

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
  String displayedHintText = "";
  bool isDateSelected = false;
  String selectedCountry = "";

  @override
  void initState() {
    super.initState();
    displayedHintText = widget.hintText;
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
                  displayedHintText,
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
        displayedHintText = "${selectedDate.toLocal()}".split(' ')[0];
        isDateSelected = true;
      });
    }
  }

  Future<void> selectCountry(BuildContext context) async {
    String? selected = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Select Country"),
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'Bangladesh');
                    },
                    child: Text("Bangladesh"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'India');
                    },
                    child: Text("India"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'Australia');
                    },
                    child: Text("Australia"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'USA');
                    },
                    child: Text("USA"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 'Nepal');
                    },
                    child: Text("Nepal"),
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
        displayedHintText = selected;
      });
    }
  }
}
