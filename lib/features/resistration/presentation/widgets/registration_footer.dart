import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';


class RegistrationFooter extends StatelessWidget {
  const RegistrationFooter({super.key, required this.clickable, required this.notClickable, required this.onPressed});

  final String clickable;
  final String notClickable;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          notClickable,
          style: AppTextStyleHelper.font14RegularGrey,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            clickable,
            style: AppTextStyleHelper.font14BoldPrimary.copyWith(
              decoration: TextDecoration.underline,
            ),
            // under line the clickable text
          ),
        ),
      ],
    );
  }
}
