import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/home/data/models/tasks_model.dart';

class QRReaderRequestImpl {
  final Dio dio;

  QRReaderRequestImpl({required this.dio});

   Future<Either<TasksResponseModel,Failure>> getTaskByQrCode({required String url}) async{
    var headers = {
      'Authorization': 'Bearer ${await AppLocalSecureStorage.getAccessToken()}'
    };
    var response = await dio.request(
      url,
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      return Left(TasksResponseModel.fromJson(response.data));
    }
    else {
      return Right(Failure(failure: FailureModel.fromJson(response.data)));
    }
  }

}