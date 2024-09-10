import 'package:dartz/dartz.dart';
import 'package:tasky/core/networking/failure/failure.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';
import 'package:tasky/features/home/data/apis/home_api_services.dart';
import 'package:tasky/features/home/data/models/log_out_models.dart';
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

}