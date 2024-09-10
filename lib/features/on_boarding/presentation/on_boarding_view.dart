import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/image_helper.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              AppImageHelper.onboardingImage,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
