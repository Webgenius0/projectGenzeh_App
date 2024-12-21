import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genzeh911/gen/assets.gen.dart';

class ShareBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shareOptions = [
      {'label': 'Copy link', 'icon': Assets.icons.copyLink, 'onTap': () {}},
      {'label': 'Messenger', 'icon': Assets.icons.facebook, 'onTap': () {}},
      {'label': 'Facebook', 'icon': Assets.icons.facebook, 'onTap': () {}},
      {'label': 'Twitter', 'icon': Assets.icons.twitter, 'onTap': () {}},
      {'label': 'Pinterest', 'icon': Assets.icons.pinterest, 'onTap': () {}},
      {'label': 'Linkedin', 'icon': Assets.icons.linkedin, 'onTap': () {}},
      {'label': 'Whatsapp', 'icon': Assets.icons.whatsapp, 'onTap': () {}},
      {'label': 'Reddit', 'icon': Assets.icons.reddit, 'onTap': () {}},
    ];

    return Container(
      padding: EdgeInsets.all(20.0.w),
      height: 281.h, // Adjust the height as needed
      child: Column(
        children: [
          const Text(
            'Share news',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: shareOptions.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 24,
                      child: SvgPicture.asset(shareOptions[index]['icon']),
                    ),
                    const SizedBox(height: 6.0),
                    Text(
                      shareOptions[index]['label'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
