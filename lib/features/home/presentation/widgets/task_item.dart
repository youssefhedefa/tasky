import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/priority_enum.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';
import 'package:tasky/features/home/presentation/widgets/cached_image.dart';
import 'package:tasky/features/home/presentation/widgets/priority_flag.dart';
import 'package:tasky/features/home/presentation/widgets/state_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task, required this.onTap});

  final TaskEntity task;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(
            imageUrl: task.imageUrl,
            width: 64,
            height: 64.h,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: AppTextStyleHelper.font16BoldBlack,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    stateChecker(),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  task.description,
                  style: AppTextStyleHelper.font14RegularGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    priorityChecker(),
                    const Spacer(),
                    Text(
                      task.dueDate,
                      style: AppTextStyleHelper.font12RegularGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }

  priorityChecker(){
    switch(task.priority){
      case 'low':
        return const PriorityFlag(
          priority: PriorityEnum.low,
        );
      case 'medium':
        return const PriorityFlag(
          priority: PriorityEnum.medium,
        );
      case 'high':
        return const PriorityFlag(
          priority: PriorityEnum.high,
        );
    }
  }

  stateChecker(){
    switch(task.status){
      case 'finished':
        return const StateContainer(
          taskState: TaskStatesEnum.finished,
        );
      case 'in progress':
        return const StateContainer(
          taskState: TaskStatesEnum.inProgress,
        );
      case 'waiting':
        return const StateContainer(
          taskState: TaskStatesEnum.waiting,
        );
    }
  }

}
