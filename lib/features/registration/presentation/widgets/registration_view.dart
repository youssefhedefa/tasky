import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/features/on_boarding/presentation/widgets/on_boarding_image.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key, required this.form});

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 400 ? 400 : double.infinity,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 400.h,
                    child: const OnBoardingImage(),
                  ),
                ),
                SliverToBoxAdapter(child: form),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
