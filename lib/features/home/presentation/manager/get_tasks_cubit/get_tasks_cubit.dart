import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/get_tasks_cubit/get_tasks_states.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  final HomeRepo repo;

  GetTasksCubit({required this.repo}) : super(GetTasksInitialState());

  getTasks({int? currentPage}) async {
    emit(GetTasksLoadingState());
    final response = await repo.getTasks(page: currentPage);
    response.fold((tasks) {
      emit(GetTasksSuccessState(tasks: tasks));
    }, (failure) {
      emit(GetTasksErrorState(message: failure.failure.message ?? 'Error Occurred'));
    });

  }
}