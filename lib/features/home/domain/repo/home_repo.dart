import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/features/home/data/models/create_task_models.dart';
import 'package:tasky/features/home/data/models/log_out_models.dart';
import 'package:tasky/features/home/data/models/upload_image_response.dart';
import 'package:tasky/features/home/domain/entities/profile_entity.dart';
import 'package:tasky/features/home/domain/entities/task_entity.dart';

abstract class HomeRepo{
  Future<Either<LogOutResponseModel,Failure>> logOut();
  Future<Either<ProfileEntity,Failure>> getProfile();
  Future<Either<UploadImageResponseModel,Failure>> uploadImage({required FormData image});
  Future<Either<AddTaskResponseModel,Failure>> addTask({required AddTaskRequestModel model});
  Future<Either<List<TaskEntity>,Failure>> getTasks({int? page});
  Future<Either<bool,Failure>> editTask({required String id,required Map<String,dynamic> request});
  Future<Either<bool,Failure>> deleteTask({required String id});

}