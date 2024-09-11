import 'package:tasky/features/home/data/models/tasks_model.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';

abstract class TasksMapper {
  static List<TaskEntity> listTasksMapper({required List<TasksResponseModel> tasksResponseModel}) => tasksResponseModel.map((task) => TaskEntity(
    id: task.id ?? "",
    title: task.title ?? "",
    description: task.desc ?? "",
    imageUrl: task.image ?? "",
    priority: task.priority ?? "",
    status: task.status ?? "",
    dueDate: '${task.createdAt?.year.toString()}/${task.createdAt?.month.toString()}/${task.createdAt?.day.toString()}',
  )).toList();

  static TaskEntity taskMapper({required TasksResponseModel task}){
    return TaskEntity(
      id: task.id ?? "",
      title: task.title ?? "",
      description: task.desc ?? "",
      imageUrl: task.image ?? "",
      priority: task.priority ?? "",
      status: task.status ?? "",
      dueDate: '${task.createdAt?.year.toString()}/${task.createdAt?.month.toString()}/${task.createdAt?.day.toString()}',
    );
  }

}