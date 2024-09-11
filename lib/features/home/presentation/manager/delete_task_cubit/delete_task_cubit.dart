import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/delete_task_cubit/delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final HomeRepo repo;

  DeleteTaskCubit({required this.repo}) : super(DeleteTaskInitialState());

  Future deleteTask(String taskId) async {
    emit(DeleteTaskLoadingState());
    final response = await repo.deleteTask(id: taskId);
    response.fold(
      (success) => emit(DeleteTaskSuccessState()),
      (error) => emit(DeleteTaskErrorState(message: error.failure.message ?? 'Error')),
    );
  }
}