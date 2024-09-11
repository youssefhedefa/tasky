
import 'package:dio/dio.dart';

class Failure {
  final FailureModel failure;

  Failure({required this.failure});

  factory Failure.fromAPI(dynamic error) {
    if(error is DioException){
      return Failure(failure: FailureModel.fromJson(error.response?.data));
    }
    return Failure(failure: FailureModel.fromJson(error));
  }

}

class FailureModel {
  final String? message;
  final String? error;
  final num? statusCode;

  factory FailureModel.fromJson(Map<String, dynamic> json){
    return FailureModel(
      message: json["message"],
      error: json["error"],
      statusCode: json["statusCode"],
    );
  }

  FailureModel({required this.message, required this.error, required this.statusCode});
}

