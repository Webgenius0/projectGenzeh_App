import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/common_widgets/custom_elevated_button.dart';
import 'package:genzeh911/common_widgets/custom_input_field_widget.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double currentRating = 0;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Assets.images.splashScreen.path,
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 380.h,
            width: 342.w,
            decoration: BoxDecoration(
              color: AppColors.cffffff,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Rate Your Experience",
                      style: TextFontStyle.textStyle24c222222UrbanistW600
                          .copyWith(color: AppColors.c000000, fontSize: 16.sp),
                    ),
                  ),
                  UIHelper.verticalSpace(15.h),
                  Center(
                    child: RatingBar.builder(
                        itemSize: 35.sp,
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            currentRating = rating;
                          });
                        }),
                  ),
                  Text(
                    "Describe Your Experience (Optional)",
                    style: TextFontStyle.textStyle14c252C2EOpenSansW400
                        .copyWith(color: AppColors.c000000, fontSize: 16.sp),
                  ),
                  CustomInputFieldWidget(
                    maxLength: 150,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    labelText: "Full Name",
                    isPasswordField: false,
                    showSuffixIcon: true,
                    hintText: 'Enter your name',
                    inputType: TextInputType.name,
                    controller: controller,
                  ),
                  UIHelper.verticalSpace(5.h),
                  customElevatedButton(
                    onPressed: () {
                      NavigationService.navigateTo(
                          Routes.subscriptionPlanScreen);
                    },
                    child: Text(
                      'Submit',
                      style:
                          TextFontStyle.textStyle14c252C2EOpenSansW400.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.cFFFFFF,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    bgColor: AppColors.allPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
