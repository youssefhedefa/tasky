import 'package:retrofit/http.dart';
import 'package:tasky/core/components/parse_error_logger.dart';
import 'package:tasky/core/networking/api_constances.dart';
import 'package:dio/dio.dart';
import 'package:tasky/features/home/data/apis/home_api_constances.dart';
import 'package:tasky/features/home/data/models/log_out_models.dart';
import 'package:tasky/features/home/data/models/profile_model.dart';

part 'home_api_services.g.dart';

@RestApi(baseUrl: BaseApiConstances.baseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio) = _HomeApiServices;

  @POST(HomeApiConstances.logOut)
  Future<LogOutResponseModel> logOut({
    @Header('Authorization') required String token,
    @Body() required LogOutRequestModel body,
  });

  @GET(HomeApiConstances.profile)
  Future<ProfileResponseModel> getProfile({
    @Header('Authorization') required String token,
  });

}
