// ignore_for_file: use_build_context_synchronously=, use_build_context_synchronously, use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/text_font_style.dart';

class ImageSourceDialog extends StatelessWidget {
  final ValueChanged<String> onImageSelected;

  const ImageSourceDialog({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text(
        'Choose Image Source',
        style: TextFontStyle.textStyle24c222222UrbanistW600
            .copyWith(fontSize: 14.sp), // Your custom text style
      ),
      actions: [
        CupertinoActionSheetAction(
          child: const Text('Camera'),
          onPressed: () async {
            XFile? image =
                await ImagePicker().pickImage(source: ImageSource.camera);
            if (image != null) {
              onImageSelected(image.path);
              log('Image path: ${image.path}');
            } else {
              log('No image selected.');
            }
            Navigator.of(context).pop();
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Gallery'),
          onPressed: () async {
            XFile? image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            if (image != null) {
              onImageSelected(image.path);
              log('Image path: ${image.path}');
            } else {
              log('No image selected.');
            }
            Navigator.of(context).pop();
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
    );
  }
}
