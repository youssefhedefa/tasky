import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/components/constances.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:tasky/features/home/presentation/manager/profile_cubit/profile_states.dart';
import 'package:tasky/features/home/presentation/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Profile',
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileFailedState) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is ProfileSuccessState) {
          return ListView.separated(
            padding: const EdgeInsets.all(24),
            itemBuilder: (context, index) => ProfileContainer(
              title: context.read<ProfileCubit>().profileList[index],
              value: state.profileEntity
                  .profile[context.read<ProfileCubit>().profileList[index]],
              hasCopyButton: context.read<ProfileCubit>().profileList[index] ==
                  AppConstances.profilePhone,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: context.read<ProfileCubit>().profileList.length,
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(24),
          itemBuilder: (context, index) => const ProfileContainer(
            title: 'Name',
            value: 'John Doe',
            hasCopyButton: true,
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: 4,
        );
      }),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  const ProfileContainer(
      {super.key,
      required this.title,
      required this.value,
      required this.hasCopyButton});

  final String title;
  final String value;
  final bool hasCopyButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyleHelper.font12MediumGrey,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                value,
                style: AppTextStyleHelper.font18BoldGrey,
              ),
            ],
          ),
          const Spacer(),
          hasCopyButton
              ? IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: value));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Copied to clipboard'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: AppColorHelper.primaryColor,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
