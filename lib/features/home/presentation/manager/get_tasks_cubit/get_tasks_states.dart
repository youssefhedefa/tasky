import 'package:tasky/features/home/domain/entities/task_entity.dart';

abstract class GetTasksState{}

class GetTasksInitialState extends GetTasksState{}

class GetTasksLoadingState extends GetTasksState{}

class GetTasksPaginationLoadingState extends GetTasksState{}

class GetTasksSuccessState extends GetTasksState{
  final List<TaskEntity> tasks;
  GetTasksSuccessState({required this.tasks});
}

class GetTasksErrorState extends GetTasksState{
  final String message;
  GetTasksErrorState({required this.message});
}