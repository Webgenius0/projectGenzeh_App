import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceBar extends StatelessWidget {
  final Color fillColor;
  final double width;

  const PerformanceBar({
    super.key,
    required this.fillColor,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 6.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Colors.white),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: (100.w / 100) * (100 - width)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r), color: fillColor),
            ),
          ],
        ));
  }
}
