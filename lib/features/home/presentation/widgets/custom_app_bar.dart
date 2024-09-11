import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/image_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppImageHelper.arrowIcon,
              width: 30,
              height: 30,
            ),
          ),
          Text(
            title,
            style: AppTextStyleHelper.font16BoldBlack,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
