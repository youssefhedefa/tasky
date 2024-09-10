import 'package:flutter/material.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/on_boarding/presentation/widgets/on_boarding_image.dart';
import 'package:tasky/features/on_boarding/presentation/widgets/on_boarding_text.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: OnBoardingImage()),
            const OnBoardingText(),
            Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 40),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstances.login, (route) => false);
                },
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
