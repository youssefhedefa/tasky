import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/task_states_enum.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/core/networking/api_constances.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';
import 'package:tasky/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_state.dart';
import 'package:tasky/features/home/presentation/widgets/back_arrow.dart';
import 'package:tasky/features/home/presentation/widgets/cached_image.dart';
import 'package:tasky/features/home/presentation/widgets/custom_date_shower.dart';
import 'package:tasky/features/home/presentation/widgets/custom_priority_widget.dart';
import 'package:tasky/features/home/presentation/widgets/qr_generator.dart';

class TaskDetailsView extends StatefulWidget {
  const TaskDetailsView({super.key, required this.task});

  final TaskEntity task;

  @override
  State<TaskDetailsView> createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends State<TaskDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        actions: [
          const BackArrow(),
          const Spacer(),
          IconButton(
            onPressed: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(
                  MediaQuery.sizeOf(context).width - 32,
                  100,
                  0,
                  0,
                ),
                color: Colors.white,
                items: [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: AppTextStyleHelper.font16BoldBlack,
                    ),
                  ),
                  PopupMenuItem(
                    onTap: (){
                      context.read<DeleteTaskCubit>().deleteTask(widget.task.id).then((value) {
                          Navigator.of(context).pop(true);
                      });
                    },
                    value: 'Delete',
                    child: Text(
                      'Delete',
                      style: AppTextStyleHelper.font16MediumOrange,
                    ),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: BlocConsumer<EditTaskCubit, EditTaskState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: CustomCachedImage(
                      imageUrl: widget.task.imageUrl,
                      height: 200.h,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    widget.task.title,
                    style: AppTextStyleHelper.font24BoldBlack,
                  ),
                  Text(
                    widget.task.description,
                    style: AppTextStyleHelper.font14RegularGrey,
                  ),
                  SizedBox(height: 16.h),
                  CustomDateShower(
                    hasBackground: true,
                    label: widget.task.dueDate,
                    clickable: false,
                    callback: (value) {
                    },
                  ),
                  SizedBox(height: 16.h),
                  CustomPriorityContainer(
                    callback: (value) {
                      context.read<EditTaskCubit>().editTask(
                        id: widget.task.id,
                        request: {'priority': value.toString().toLowerCase()},
                      );
                    },
                    options: const ['Low', 'Medium', 'High'],
                    label: widget.task.priority,
                    hasFlagIcon: true,
                  ),
                  SizedBox(height: 16.h),
                  CustomPriorityContainer(
                    callback: (value) {
                      context.read<EditTaskCubit>().editTask(
                        id: widget.task.id,
                        request: {'status': value.toString().toLowerCase()},
                      );
                    },
                    options: [
                      taskStatesValues[TaskStatesEnum.waiting]!,
                      taskStatesValues[TaskStatesEnum.inProgress]!,
                      taskStatesValues[TaskStatesEnum.finished]!
                    ],
                    label: widget.task.status,
                    hasFlagIcon: false,
                  ),
                  SizedBox(height: 16.h),
                  CustomQRGenerator(
                    request:
                        '${BaseApiConstances.baseUrl}todos/${widget.task.id}',
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is EditTaskLoading) {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            }
            if (state is EditTaskSuccess) {
              Navigator.of(context).pop(true);
              Navigator.of(context).pop(true);
            }
          },
        ),
      ),
    );
  }
}
