import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genzeh911/constants/text_font_style.dart';
import 'package:genzeh911/gen/assets.gen.dart';
import 'package:genzeh911/gen/colors.gen.dart';
import 'package:genzeh911/helpers/all_routes.dart';
import 'package:genzeh911/helpers/loading_helper.dart';
import 'package:genzeh911/helpers/navigation_service.dart';
import 'package:genzeh911/helpers/toast.dart';
import 'package:genzeh911/networks/api_acess.dart';

class QuickScanScreen extends StatefulWidget {
  const QuickScanScreen({Key? key}) : super(key: key);

  @override
  State<QuickScanScreen> createState() => _QuickScanScreenState();
}

class _QuickScanScreenState extends State<QuickScanScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras != null && _cameras!.isNotEmpty) {
        _cameraController = CameraController(
          _cameras!.first,
          ResolutionPreset.high,
        );
        await _cameraController!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      }
    } catch (e) {
      debugPrint("Camera initialization error: $e");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Camera Preview
          if (_isCameraInitialized && _cameraController != null)
            CameraPreview(_cameraController!)
          else
            Container(
              color: AppColors.c000000.withOpacity(0.4),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),

          // Centered Frame
          Center(
            child: Container(
              width: 320.w,
              height: 530.h,
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

          // Flash Button
          Positioned(
            top: 53,
            left: 10,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Toggle flash logic here
              },
              icon: SvgPicture.asset(
                Assets.icons.flashOff,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Scanning Label
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Text(
                "Scanning",
                style: TextFontStyle.textStylec212121OpenSansW600.copyWith(
                  color: AppColors.cFFFFFF,
                  fontSize: 20.sp,
                  letterSpacing: -0.4.sp,
                ),
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 50,
            right: 10,
            child: IconButton(
              onPressed: () => NavigationService.goBack(),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),

          // Bottom Controls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cC4C4C4,
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                    height: 70.0.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Camera button
                        GestureDetector(
                          onTap: () {
                            // if (_cameraController != null &&
                            //     _cameraController!.value.isInitialized) {
                            //   // Implement capture logic here
                            //   NavigationService.navigateTo(
                            //       Routes.scanningReportScreen);
                            // }
                            _captureImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SvgPicture.asset(
                              Assets.icons.camera,
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.contain,
                            ),
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

Future<void> _captureImage() async {
  if (_cameraController == null || !_cameraController!.value.isInitialized) {
    return;
  }

  try {
    final XFile image = await _cameraController!.takePicture();
    final result = await scanResultRx
        .scan(image: File(image.path))
        .waitingForFutureWithoutBg();

    scanHistoryRx.scanHistory();

    log("Scan result: $result");
    log("Image Path: ${image.path}");

    if (result != null) {
      // Navigate to scan report screen
      NavigationService.navigateToWithArgs(
          Routes.scanningReportScreen, {"responseData": result});
    } else {
      ToastUtil.showShortToast("No valid scan result found. Please try again.");
    }
  } catch (e) {
    log("Error capturing image: $e");
    
    if (e.toString().contains("422")) {
      ToastUtil.showShortToast("Failed to scan the image. Please use a clearer image.");
    } else {
      ToastUtil.showShortToast("An unexpected error occurred. Please try again.");
    }
  }
}

}
