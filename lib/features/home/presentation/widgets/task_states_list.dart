import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/features/home/presentation/widgets/task_list.dart';

class TaskStatesList extends StatefulWidget {
  const TaskStatesList({super.key});

  @override
  State<TaskStatesList> createState() => _TaskStatesListState();
}

class _TaskStatesListState extends State<TaskStatesList> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  buildTaskState(index),
          separatorBuilder: (context, index) => const SizedBox(width: 8,),
          itemCount: 4,
      ),
    );
  }

  buildTaskState(int index) {
    List<String> titles = ['All', 'In progress', 'Waiting', 'Finished'];
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: TaskState(
        title: titles[index],
        isSelected: index == selectedIndex,
      ),
    );
  }
}

