// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:tasky/core/networking/api_constances.dart';
import 'package:tasky/core/networking/local_storage/local_storage.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;

  TokenInterceptor({required this.dio});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final errorCode = err.response?.statusCode ?? 0;
    try{
      if (errorCode == 401) {
        print('error code 401');
        await _refreshToken();
        print('token refreshed');
        return handler.resolve(await _retry(err.requestOptions));
      }
    }catch (e){
      print('error from token interceptor onError Function $e');
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options.copyWith(
        headers: {
          'Authorization': 'Bearer ${await AppLocalSecureStorage.getAccessToken()}',
        },
      ),
    );
  }

  Future<bool> _refreshToken() async {
    final String accessToken =
        await AppLocalSecureStorage.getAccessToken() ?? '';
    final String refreshToken =
        await AppLocalSecureStorage.getRefreshToken() ?? '';
    var headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final response = await dio.get(
        '${BaseApiConstances.baseUrl}auth/refresh-token?token=$refreshToken',
        options: Options(headers: headers));

    if (response.statusCode == 200) {
      final jsonResponse = RefreshTokenModel.fromJson(response.data);
      await AppLocalSecureStorage.saveAccessToken(token: jsonResponse.token);
      return true;
    } else {
      print('error from refresh token${response.data}');
      print(response.statusMessage);
      return false;
    }
  }
}

class RefreshTokenModel {
  final String token;

  RefreshTokenModel({required this.token});

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokenModel(
      token: json['access_token'],
    );
  }
}
