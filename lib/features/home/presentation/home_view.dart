import 'package:flutter/material.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/presentation/widgets/home_app_bar.dart';
import 'package:tasky/features/home/presentation/widgets/task_states_list.dart';
import 'package:tasky/features/home/presentation/widgets/tasks_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(
              Icons.qr_code,
              color: AppColorHelper.primaryColor,
              size: 30,
            ),
          ),
          const SizedBox(height: 14),
          FloatingActionButton(
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            backgroundColor: AppColorHelper.primaryColor,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Tasks',
              style: AppTextStyleHelper.font14BoldGrey,
            ),
            const SizedBox(height: 16),
            const TaskStatesList(),
            const SizedBox(height: 16),
            const Expanded(child: TasksList()),

          ],
        ),
      ),
    );
  }
}
