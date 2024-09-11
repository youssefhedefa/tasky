import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/color_helper.dart';

abstract class AppTextStyleHelper{
  static TextStyle font24BoldBlack = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font12RegularGrey = const TextStyle(
    fontSize: 12,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font12MediumGrey = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font14MediumBlack = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font14RegularBlack = const TextStyle(
    fontSize: 14,
  );

  static TextStyle font14RegularGrey = const TextStyle(
    fontSize: 14,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font14BoldGrey = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.greyColor,
  );

  static TextStyle font14BoldPrimary = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primaryColor,
  );

  static TextStyle font16RegularGrey = const TextStyle(
    fontSize: 16,
    color: AppColorHelper.greyColor,
  );
  static TextStyle font16MediumOrange = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColorHelper.orangeColor,
  );

  static TextStyle font16BoldWhite = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font16BoldBlack = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font16BoldPrimary = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primaryColor,
  );

  static TextStyle font19BoldWhite = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font19BoldPrimary = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.primaryColor,
  );

  static TextStyle font18BoldGrey = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColorHelper.greyColor,
  );

}