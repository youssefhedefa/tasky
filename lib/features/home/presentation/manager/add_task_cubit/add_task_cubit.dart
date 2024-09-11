import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/home/data/models/create_task_models.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';
import 'package:tasky/features/home/presentation/manager/add_task_cubit/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  final HomeRepo repo;

  AddTaskCubit({required this.repo}) : super(AddTaskInitialState());

  String image = 'https://todo.iraqsapp.com//images/1726063632222-18766-images%20(1).jpg';
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  String priority = 'Medium';
  DateTime dueDate = DateTime.now();

  reset() {
    title.clear();
    desc.clear();
    priority = 'Medium';
    dueDate = DateTime.now();
  }

  Future<void> addTask({
    required String image,
    required String title,
    required String desc,
    required String priority,
    required DateTime dueDate,
  }) async {
    emit(AddTaskLoadingState());
    final result = await repo.addTask(
      model: AddTaskRequestModel(
        image: image,
        title: title,
        desc: desc,
        priority: priority,
        dueDate: dueDate,
      ),
    );
    result.fold(
      (response) => emit(AddTaskSuccessState()),
      (failure) =>
          emit(AddTaskErrorState(error: failure.failure.message ?? 'Error')),
    );
  }
}
