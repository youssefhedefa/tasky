import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/color_helper.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.child});
  final Widget child;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColorHelper.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
