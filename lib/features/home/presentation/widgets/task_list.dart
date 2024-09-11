import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class TaskState extends StatelessWidget {
  const TaskState({super.key, required this.title, required this.isSelected});

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColorHelper.primaryColor : AppColorHelper.lightPrimaryColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Text(
          title,
          style: isSelected ? AppTextStyleHelper.font16BoldWhite : AppTextStyleHelper.font16RegularGrey,
        )
    );
  }
}
