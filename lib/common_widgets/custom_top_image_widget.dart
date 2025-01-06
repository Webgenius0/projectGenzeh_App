// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


final class CustomTopImageWidget extends StatelessWidget {
  final String? url;
  double height;
  double width;

  CustomTopImageWidget(
      {super.key, this.url, this.width = 0.0, this.height = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height != 0.0 ? height : null,
      width: width != 0.0 ? width : null,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(url!,),fit: BoxFit.fill)),
    );
  }
}
