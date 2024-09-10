import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/routing/routing_constances.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_cubit.dart';
import 'package:tasky/features/home/presentation/manager/log_out_cubit/log_out_states.dart';


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
            BlocConsumer<LogOutCubit,LogOutState>(
              builder: (context, state) {
                if(state is LogOutLoadingState) {
                  return const CircularProgressIndicator();
                }
                return IconButton(
                  onPressed: () {
                    context.read<LogOutCubit>().logOutEmitted();
                  },
                  icon: const Icon(
                      Icons.exit_to_app,
                    color: AppColorHelper.primaryColor,
                  ),
                );
              },
              listener: (context, state) {
                if(state is LogOutSuccessState) {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutingConstances.onboarding, (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(70);
}
