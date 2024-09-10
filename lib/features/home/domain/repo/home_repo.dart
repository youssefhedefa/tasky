import 'package:dartz/dartz.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/features/home/data/models/log_out_models.dart';

abstract class HomeRepo{
  Future<Either<LogOutResponseModel,Failure>> logOut();
}