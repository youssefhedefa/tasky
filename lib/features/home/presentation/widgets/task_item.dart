import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/priority_enum.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/image_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/presentation/widgets/priority_flag.dart';
import 'package:tasky/features/home/presentation/widgets/state_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
            AppImageHelper.taskTestImage,
            width: 64.w,
            height: 64.h,
          fit: BoxFit.fill,
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
                      'Task title Task titleTask title Task title',
                      style: AppTextStyleHelper.font16BoldBlack,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const StateContainer(
                    taskState: TaskStatesEnum.finished,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Task descriptionTask descriptionTask descriptionTask descriptionTask descriptionTask description',
                style: AppTextStyleHelper.font14RegularGrey,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const PriorityFlag(
                    priority: PriorityEnum.low,
                  ),
                  const Spacer(),
                  Text(
                    '30/12/2022',
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
}
