import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/colors.gen.dart';

class ShareBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> shareOptions = [
    //   {'label': 'Copy link', 'icon': Assets.icons.copyLink, 'onTap': () {}},
    //   {'label': 'Messenger', 'icon': Assets.icons.facebook, 'onTap': () {}},
    //   {'label': 'Facebook', 'icon': Assets.icons.facebook, 'onTap': () {}},
    //   {'label': 'Twitter', 'icon': Assets.icons.twitter, 'onTap': () {}},
    //   {'label': 'Pinterest', 'icon': Assets.icons.pinterest, 'onTap': () {}},
    //   {'label': 'Linkedin', 'icon': Assets.icons.linkedin, 'onTap': () {}},
    //   {'label': 'Whatsapp', 'icon': Assets.icons.whatsapp, 'onTap': () {}},
    //   {'label': 'Reddit', 'icon': Assets.icons.reddit, 'onTap': () {}},
    // ];

    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: const Text(
              'Share news',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          // Text(
          //   "Title",
          //   style: TextFontStyle.textStyle18c4A80E1PoppinsW600
          //       .copyWith(color: AppColors.c000000),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 210.w,
                child: CustomInputFieldWidget(
                  labelText: "Title",
                  isPasswordField: true,
                  showSuffixIcon: false,
                  hintText: "Write Title",
                  inputType: TextInputType.text,
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 120.w,
                height: 150.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 24.h),
                    child: customElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Save',
                        style: TextFontStyle.textStyle14c252C2EOpenSansW400
                            .copyWith(
                          fontSize: 12.sp,
                          color: AppColors.cFFFFFF,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      bgColor: AppColors.allPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
