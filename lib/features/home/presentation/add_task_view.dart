import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/components/constances.dart';
import 'package:tasky/core/components/custom_button.dart';
import 'package:tasky/core/helpers/color_helper.dart';
import 'package:tasky/core/helpers/text_style_helper.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_states.dart';
import 'package:tasky/features/home/presentation/widgets/add_task_field.dart';
import 'package:tasky/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:tasky/features/home/presentation/widgets/custom_date_shower.dart';
import 'package:tasky/features/home/presentation/widgets/custom_priority_widget.dart';
import 'package:tasky/features/home/presentation/widgets/image_selection_container.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: 'Add new task',
          ),
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width > AppConstances.maxWidth ? AppConstances.maxWidth.toDouble() : double.infinity,
              child: Padding(
                padding: EdgeInsets.all(22.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ImageSelectionContainer(),
                      AddTaskField(
                        label: 'Title',
                        controller: context.read<AddTaskCubit>().title,
                        hintText: 'Enter task title',
                        isMultiline: false,
                      ),
                      AddTaskField(
                        label: 'Description',
                        controller: context.read<AddTaskCubit>().desc,
                        hintText: 'Enter description title',
                        isMultiline: true,
                      ),
                      AddTaskField(
                          label: 'Priority',
                          input: CustomPriorityContainer(
                            callback: (value) {
                              context.read<AddTaskCubit>().priority = value;
                            },
                            options: const ['Low', 'Medium', 'High'],
                            label: 'Priority',
                            hasFlagIcon: true,
                          ),
                      ),
                      AddTaskField(
                        label: 'Due date',
                        input: CustomDateShower(
                          clickable: true,
                          hasBackground: false,
                          callback: (value) {
                            context.read<AddTaskCubit>().dueDate = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        child: Text(
                          'Add Task',
                          style: AppTextStyleHelper.font19BoldWhite,
                        ),
                        onPressed: () {
                          addTaskAction(
                            context: context,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is AddTaskLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColorHelper.primaryColor,
              ),
            ),
          );
        }
        if (state is AddTaskSuccessState) {
          context.read<AddTaskCubit>().reset();
          Navigator.pop(context, true);
          Navigator.pop(context, true);
        }
      },
    );
  }

  addTaskAction({required BuildContext context}) {
    context.read<AddTaskCubit>().addTask(
          image: context.read<AddTaskCubit>().image,
          title: context.read<AddTaskCubit>().title.text,
          desc: context.read<AddTaskCubit>().desc.text,
          priority: context.read<AddTaskCubit>().priority.toLowerCase(),
          dueDate: context.read<AddTaskCubit>().dueDate,
        );
  }
}
