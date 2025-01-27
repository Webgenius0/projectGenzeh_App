import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/ui_helpers.dart';

class PopUpMenuButton extends StatelessWidget {
  const PopUpMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        onSelected: (String value) {
          if (value == 'edit') {
            // NavigationService.navigateTo(Routes.editOrDeleteScreen);
          } else if (value == 'delete') {
            showDialog(
              context: context,
              barrierDismissible:
                  false, // Prevent dismissing the dialog by tapping outside
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Border radius of 12
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize
                          .min, // Makes the column take only as much space as needed
                      children: [
                        // Image in the dialog

                        SvgPicture.asset(Assets.icons.delete,
                            height: 143.h), // Use your own image
                        UIHelper.verticalSpace(24.h),
                        // Text in the dialog
                        Text(
                          'Delete',
                          style: TextFontStyle.textStyle14c252C2EOpenSansW400
                              .copyWith(
                            color: AppColors.c00B822,
                            fontSize: 24.sp,
                            letterSpacing: -0.24.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        UIHelper.verticalSpace(16.h),
                        Text(
                          'are you sure you want to delete \nthis word list?',
                          style: TextFontStyle.textStyle14c252C2EOpenSansW400
                              .copyWith(
                            color: AppColors.c00B822,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        UIHelper.verticalSpace(16.h),
                        // Button to go to the home screen

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // CustomButton(
                            //   bgColor: Colors.transparent,
                            //   callback: () {},
                            //   name: 'Cancel',
                            //   textColor: AppColors.allPrimaryColor,
                            //   borderColor: AppColors.allPrimaryColor,
                            // ),
                            // UIHelper.horizontalSpace(16.w),
                            // CustomButton(
                            //   bgColor: AppColors.allPrimaryColor,
                            //   callback: () {},
                            //   name: 'Yes',
                            //   textColor: AppColors.cFFFFFF,
                            //   borderColor: Colors.transparent,
                            // ),
                          ],
                        ),
                        // customElevatedButton(
                        //     onPressed: () {
                        //       // Get.to(() => BottomNavBar());
                        //     },
                        //     child: Text(
                        //       'Back to Home',
                        //       style: TextFontStyle.textStyle16cFFFFFFPoppinsW500
                        //           .copyWith(fontSize: 16.sp),
                        //     ),
                        //     bgColor: AppColors.allPrimaryColor),

                        UIHelper.verticalSpace(53.h),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem<String>(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
              ),
            ),
            const PopupMenuItem<String>(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
              ),
            ),
          ];
        },
        child: Icon(Icons.more_vert));
  }
}
