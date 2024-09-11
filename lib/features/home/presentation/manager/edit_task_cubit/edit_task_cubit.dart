import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/edit_task_cubit/edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {

  final HomeRepo repo;

  EditTaskCubit({required this.repo}) : super(EditTaskInitial());

  void editTask({required String id, required Map<String,String> request}) async {
    emit(EditTaskLoading());
    final response = await repo.editTask(
      id: id,
      request: request,
    );
    response.fold(
      (success) => emit(EditTaskSuccess()),
      (error) => emit(EditTaskFailure(message: error.failure.message ?? 'An error occurred')),
    );
  }
}