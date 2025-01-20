import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:lottie/lottie.dart';
import '../helpers/navigation_service.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: shimmer(
            context: NavigationService.context,
            name: Assets.json.loading,
            color: AppColors.allPrimaryColor,
            size: 220.sp));
  }
}

Widget shimmer({
  String? name,
  required BuildContext context,
  Color? color,
  double? size,
}) {
  return Center(
    child: Container(
      child: Lottie.asset(name ?? "", width: size, height: size),
    ),
  );
}
