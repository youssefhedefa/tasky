import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/helpers/color_helper.dart';

abstract class AppTextStyleHelper{
  static TextStyle font24BoldBlack = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font14RegularGrey = TextStyle(
    fontSize: 14.sp,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font14BoldGrey = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font14BoldPrimary = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primaryColor,
  );

  static TextStyle font19BoldWhite = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

}