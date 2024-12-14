import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required Widget child,
  required Color bgColor,
  Color? borderColor,
  bool? isBorder,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: child,
    style: ElevatedButton.styleFrom(
      // shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(39.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
      backgroundColor: bgColor,
      minimumSize: Size(double.infinity, 50.h),
      side: borderColor != null
          ? BorderSide(
              width: 1,
              color: borderColor,
            )
          : null,
    ),
  );
}
