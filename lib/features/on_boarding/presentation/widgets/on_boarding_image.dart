import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/image_helper.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        AppImageHelper.onboardingImage,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
