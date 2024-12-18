import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/ui_helpers.dart';

// ignore: non_constant_identifier_names
Widget AuthCustomButton({
  required String name,
  required VoidCallback onCallBack,
  required double height,
  required double borderRadius,
  required Color color,
  required TextStyle textStyle,
  required BuildContext context,
  required String icon,
  Color? borderColor,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4))
    ),
    child: MaterialButton(
      onPressed: onCallBack,
      elevation: 0,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      color: color,
      splashColor: Colors.white.withOpacity(0.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon,height: 28.h, width: 28.w,),
          UIHelper.horizontalSpace(12.w),
          Text(
            name,
            style: textStyle,
          ),
        ],
      ),
    ),
  );
}
