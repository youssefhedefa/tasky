// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/features/registration/data/apis/registration_api_services.dart';
import 'package:tasky/features/registration/data/models/log_in/log_in_request.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_response.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_request.dart';
import 'package:tasky/features/registration/domain/repo/registration_repo.dart';

class RegistrationRepoImple extends RegistrationRepo {

  final RegistrationApiServices apiServices;

  RegistrationRepoImple({required this.apiServices});

  @override
  Future<Either<SignInResponseModel, Failure>> signIn({required SignInRequestModel signInModel}) async {
    try{
      final response = await apiServices.signIn(body: signInModel);
      return Left(response);
    }catch (e){
      return Right(Failure.fromAPI(e));
    }
  }

  @override
  Future<Either<SignInResponseModel, Failure>> logIn({required LogInRequestModel logInModel}) async {
    try{
      final response = await apiServices.logIn(body: logInModel);
      return Left(response);
    }catch (e){
      return Right(Failure.fromAPI(e));
    }
  }

}