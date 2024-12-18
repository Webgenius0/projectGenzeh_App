import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/colors.gen.dart';

class CustomSeparator extends StatelessWidget {
  const CustomSeparator(
      {Key? key, this.height = 1, this.color = AppColors.c0A3004, this.padding})
      : super(key: key);
  final double height;
  final Color color;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dashHeight = height;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 20.w),
          child: SizedBox(
            height: dashHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color),
            ),
          ),
        );
      },
    );
  }
}
