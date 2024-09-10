import 'package:flutter/material.dart';
import 'package:tasky/features/on_boarding/presentation/widgets/on_boarding_image.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key, required this.form});

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: OnBoardingImage()),
            SliverToBoxAdapter(child: form),
          ],
        ),
      ),
    );
  }

}
