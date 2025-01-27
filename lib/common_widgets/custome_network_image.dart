import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';

class CustomNetworkImageWidget extends StatelessWidget {
  final String urls;
  final double? height;
  final double? width;
  const CustomNetworkImageWidget(
      {super.key, required this.urls, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$urls",
      fit: BoxFit.cover,
      height: height?.h,
      width: width?.w,
      placeholder: (context, url) =>
          // customShimmer(),
          Container(
        color: AppColors.cffffff,
        child: Image.asset(
          Assets.images.placeholderImage.path,
          fit: BoxFit.cover,
          height: height?.h,
          width: height?.w,
        ),
      ),
      errorWidget: (context, string, url) =>
          // customShimmer()
          // Image.asset(Assets.images.placeholderImage.path),
          Container(
              color: AppColors.cffffff,
              child: Image.asset(
                Assets.images.placeholderImage.path,
                fit: BoxFit.cover,
                height: height?.h,
                width: width?.w,
              )),
    );
  }
}
