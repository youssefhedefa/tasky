import 'package:flutter/material.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/helpers/image_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/on_boarding/presentation/widgets/on_boarding_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                AppImageHelper.onboardingImage,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const OnBoardingText(),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 40),
              child: CustomButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Get Started',
                      style: AppTextStyleHelper.font19BoldWhite,
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
