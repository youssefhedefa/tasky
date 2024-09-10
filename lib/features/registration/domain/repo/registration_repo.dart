import 'package:dartz/dartz.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/features/registration/data/models/log_in/log_in_request.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_response.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_request.dart';

abstract class RegistrationRepo {
  Future<Either<SignInResponseModel,Failure>> signIn({required SignInRequestModel signInModel});
  Future<Either<SignInResponseModel,Failure>> logIn({required LogInRequestModel logInModel});
}