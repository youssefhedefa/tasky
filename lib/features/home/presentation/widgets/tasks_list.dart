import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_states.dart';
import 'package:tasky/features/home/presentation/widgets/task_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  late ScrollController scrollController;

  int currentPage = 2;

  List<TaskEntity> tasks = [];

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
    scrollController.addListener(scrollListener);
  }

  scrollListener(){
    if(scrollController.offset >= scrollController.position.maxScrollExtent){
      print('end of list');
      setState(() {
        context.read<GetTasksCubit>().getTasks(
          currentPage: currentPage,
        );
        currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit,GetTasksState>(
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
        if(state is GetTasksSuccessState || state is GetTasksPaginationLoadingState){
          if(tasks.isEmpty){
            return const Center(
              child: Text('No Tasks'),
            );
          }
          return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) => TaskItem(
              task: tasks[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemCount: tasks.length,
          );
        }
        return const SizedBox();
      },
      listener: (context,state) {
        if(state is GetTasksPaginationLoadingState){
          print('loading more');
        }
        if(state is GetTasksSuccessState){
          tasks.addAll(state.tasks);
        }
      },
    );
  }
}



