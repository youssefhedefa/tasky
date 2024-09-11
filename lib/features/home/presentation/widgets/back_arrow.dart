import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/image_helper.dart';


class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pop(context,true);
      },
      child: Image.asset(
        AppImageHelper.arrowIcon,
        width: 30,
        height: 30,
      ),
    );
  }
}
