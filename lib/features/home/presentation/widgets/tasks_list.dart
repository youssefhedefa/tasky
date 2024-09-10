import 'package:flutter/material.dart';
import 'package:tasky/features/home/presentation/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const TaskItem(),
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
      itemCount: 4,
    );
  }
}



