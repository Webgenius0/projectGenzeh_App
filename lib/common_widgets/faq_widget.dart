// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../../constants/text_font_style.dart';
// import '../../../../../gen/assets.gen.dart';
// import '../../../../../gen/colors.gen.dart';
// import '../../../../../helpers/ui_helpers.dart';



// final class FaqWidget extends StatefulWidget {
//   double height;
//   double width;
//   BoxBorder? border;
//   bool isEditable;

//   final FaqWidget classDetails;

//   FaqWidget(
//       {super.key,
//         this.width = 0.0,
//         this.height = 0.0,
//         this.border,
//         this.isEditable = false,
//         required this.classDetails});

//   @override
//   State<FaqWidget> createState() =>
//       _FaqWidgetState();
// }

// class _FaqWidgetState
//     extends State<FaqWidget> {
//   bool isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.r), border: widget.border),
//       padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.classDetails.teacherName.toString(),
//                 style: TextFontStyle.textStyle15c242424LatoW700,
//               ),

//               Text(
//                 '${widget.classDetails.timeStatus}',
//                 style: TextFontStyle.textStyle12c6B6B6BLatoW400
//                     .copyWith(color: AppColors.c333333),
//               )
//             ],
//           ),
//           Text(
//             widget.classDetails.teacherDesignation.toString(),
//             style: TextFontStyle.textStyle12c6B6B6BLatoW400.copyWith(color: AppColors.c333333),
//           ),
//           if(isExpanded)
//           Divider(color: AppColors.c6B6B6B.withOpacity(0.5)),
//           Visibility(
//             visible: isExpanded,
//             child:  Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 UIHelper.verticalSpace(6.5.h),
//                 Text(
//                   'Reason',
//                   style: TextFontStyle.textStyle12c000000DmSansRegular,
//                 ),
//                 Text(
//                   'Due to unforeseen circumstances, such as overlapping deadlines in multiple courses and unexpected personal obligations, I am unable to complete the assignment by the original due date.',
//                   style: TextFontStyle.textStyle12c6B6B6BLatoW400,
//                 ),
//               ],
//             ),
//           ),
//           UIHelper.verticalSpace( isExpanded ? 20.h :16.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('${widget.classDetails.classStatus}',
//                   style: TextFontStyle.textStyle15c242424LatoW700
//                       .copyWith(color: AppColors.c333333,fontSize: 18.sp)),
//               GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isExpanded = !isExpanded;
//                     });
//                   },
//                   child: isExpanded
//                       ? SvgPicture.asset(Assets.icons.arrowSquareUp)
//                       : SvgPicture.asset(Assets.icons.arrowDown))
//               // if (isEditable)
//               //   SvgPicture.asset(Assets.icons.edit),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }