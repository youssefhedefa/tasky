import 'package:retrofit/http.dart';
import 'package:tasky/core/components/parse_error_logger.dart';
import 'package:tasky/core/networking/api_constances.dart';
import 'package:dio/dio.dart';
import 'package:tasky/features/registration/data/models/log_in/log_in_request.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_response.dart';
import 'package:tasky/features/registration/data/models/sign_in/sign_in_request.dart';
import 'registration_api_constances.dart';

part 'registration_api_services.g.dart';

@RestApi(baseUrl: BaseApiConstances.baseUrl)
abstract class RegistrationApiServices {
  factory RegistrationApiServices(Dio dio) = _RegistrationApiServices;

  @POST(RegistrationApiConstances.signIn)
  Future<SignInResponseModel> signIn({
    @Body() required SignInRequestModel body,
  });

  @POST(RegistrationApiConstances.logIn)
  Future<SignInResponseModel> logIn({
    @Body() required LogInRequestModel body,
  });

}
