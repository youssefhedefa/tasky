import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_states.dart';
import 'package:tasky/features/home/presentation/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit,GetTasksState>(
      builder: (context,state) {
        if(state is GetTasksLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is GetTasksErrorState){
          return Center(
            child: Text(state.message),
          );
        }
        if(state is GetTasksSuccessState){
          if(state.tasks.isEmpty){
            return const Center(
              child: Text('No Tasks'),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) => TaskItem(
              task: state.tasks[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemCount: state.tasks.length,
          );
        }
        // return ListView.separated(
        //   itemBuilder: (context, index) => TaskItem(),
        //   separatorBuilder: (context, index) => const SizedBox(
        //     height: 12,
        //   ),
        //   itemCount: 4,
        // );
        return const SizedBox();
      }
    );
  }
}



