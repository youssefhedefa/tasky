import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
                'Logo',
              style: AppTextStyleHelper.font24BoldBlack,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                  Icons.account_circle_outlined,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                  Icons.exit_to_app,
                color: AppColorHelper.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(70);
}
