import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/priority_enum.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';
import 'package:tasky/features/home/presentation/widgets/priority_flag.dart';
import 'package:tasky/features/home/presentation/widgets/state_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.network(
        //     task.imageUrl,
        //     width: 64.w,
        //     height: 64.h,
        //   fit: BoxFit.fill,
        // ),
        CachedNetworkImage(
          imageUrl: task.imageUrl,
          imageBuilder: (context, imageProvider) =>  Container(
            width: 64.w,
            height: 64.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  task.imageUrl,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
          const Icon(Icons.error),
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
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  priorityChecker(){
    if(task.priority == 'low'){
      return const PriorityFlag(
        priority: PriorityEnum.low,
      );
    }
    if(task.priority == 'medium'){
      return const PriorityFlag(
        priority: PriorityEnum.medium,
      );
    }
    if(task.priority == 'high'){
      return const PriorityFlag(
        priority: PriorityEnum.high,
      );
    }
  }

  stateChecker(){
    if(task.status == 'finished'){
      return const StateContainer(
        taskState: TaskStatesEnum.finished,
      );
    }
    if(task.status == 'in_progress'){
      return const StateContainer(
        taskState: TaskStatesEnum.inProgress,
      );
    }
    if(task.status == 'waiting'){
      return const StateContainer(
        taskState: TaskStatesEnum.waiting,
      );
    }
  }

}
