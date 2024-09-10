import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 60, vertical: 24),
      child: Column(
        children: [
          Text(
            'Task Management & To-Do List',
            style: AppTextStyleHelper.font24BoldBlack,
            textAlign: TextAlign.center,
          ),
          Text(
            'This productive tool is designed to help you better manage your task project-wise conveniently!',
            style: AppTextStyleHelper.font14RegularGrey,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
