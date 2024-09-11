import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:dotted_border/dotted_border.dart';


class ImageSelectionContainer extends StatelessWidget {
  const ImageSelectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      radius: const Radius.circular(12),
      borderType: BorderType.RRect,
      color: AppColorHelper.primaryColor,
      strokeWidth: 2,
      child: Container(
        padding: EdgeInsets.all(16.w),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.image_outlined,
              color: AppColorHelper.primaryColor,
              size: 30.sp,
            ),
            const SizedBox(width: 8),
            Text(
              'Add Img',
              style: AppTextStyleHelper.font19BoldPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
