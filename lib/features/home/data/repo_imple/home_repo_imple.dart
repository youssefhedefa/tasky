import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/home/data/apis/home_api_services.dart';
import 'package:tasky/features/home/data/mapper/profile_mapper.dart';
import 'package:tasky/features/home/data/models/create_task_models.dart';
import 'package:tasky/features/home/data/models/log_out_models.dart';
import 'package:tasky/features/home/data/models/upload_image_response.dart';
import 'package:tasky/features/home/domain/entities/profile_entity.dart';
import 'package:tasky/features/home/domain/repo/home_repo.dart';

class HomeRepoImple extends HomeRepo {
  final HomeApiServices apiServices;

  HomeRepoImple({required this.apiServices});
  
  @override
  Future<Either<LogOutResponseModel, Failure>> logOut() async {
    try{
      final String token = await AppLocalSecureStorage.getAccessToken() ?? '';
      final String refreshToken = await AppLocalSecureStorage.getRefreshToken() ?? '';
      print('refresh token $refreshToken token $token');
      final response = await apiServices.logOut(token: 'Bearer $token', body: LogOutRequestModel(token: refreshToken));
      return Left(response);
    }
    catch(e){
      print('error from log out $e');
      return Right(Failure.fromAPI(e));
    }
  }

  @override
  Future<Either<ProfileEntity, Failure>> getProfile() async {
    try{
      final response = await apiServices.getProfile(token: 'Bearer ${await AppLocalSecureStorage.getAccessToken()}');
      final profile = ProfileMapper.profileMapper(model: response);
      return Left(profile);
    }
    catch(e){
      return Right(Failure.fromAPI(e));
    }
  }

  @override
  Future<Either<UploadImageResponseModel, Failure>> uploadImage({required FormData image}) async {
    final response = apiServices.uploadImage(token: 'Bearer ${await AppLocalSecureStorage.getAccessToken()}',image: image);
    try{
      return Left(await response);
    }
    catch(e){
      return Right(Failure.fromAPI(e));
    }
  }

  @override
  Future<Either<AddTaskResponseModel, Failure>> addTask({required AddTaskRequestModel model}) async{
    try{
      final response = await apiServices.createTask(token: 'Bearer ${await AppLocalSecureStorage.getAccessToken()}', request: model);
      return Left(response);
    }
    catch(e){
      return Right(Failure.fromAPI(e));
    }
  }

}