import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';

class QuickScanScreen extends StatelessWidget {
  const QuickScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Camera Preview Background (Replace this with actual CameraPreview if using a camera package)
          Container(
            color: Colors.grey[900], // Placeholder color for camera preview
          ),

          // Scanning Overlay
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Top Text
          Positioned(
            top: 60,
            left: 20,
            child: Text(
              "Scanning",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),

          // Bottom Camera Controls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Bottom Photo Carousel Placeholder
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.cC4C4C4,
                        borderRadius: BorderRadius.circular(48.r)),
                    height: 70.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Assets.images.pic
                              .path, // Placeholder for carousel images
                          width: 80,
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add functionality for capture
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add functionality for camera switching
                          },
                          icon: Icon(
                            Icons.cameraswitch,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
