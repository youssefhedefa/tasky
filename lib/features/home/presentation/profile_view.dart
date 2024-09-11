import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/widgets/custom_app_bar.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
      ),
      body: Center(
        child: Text('Profile View'),
      ),
    );
  }
}
