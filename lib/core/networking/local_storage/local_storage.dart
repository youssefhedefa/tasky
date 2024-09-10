import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppLocalSecureStorage{

  static const storage = FlutterSecureStorage();

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  static Future<void> saveAccessToken({required String token}) async {
    await storage.write(key: accessTokenKey, value: token);
  }

  static Future<String?> getAccessToken() async {
    return await storage.read(key: accessTokenKey);
  }

  static Future<void> saveRefreshToken({required String token}) async {
    await storage.write(key: refreshTokenKey, value: token);
  }

  static Future<String?> getRefreshToken() async {
    print('getting token ${await storage.read(key: refreshTokenKey)}');
    return await storage.read(key: refreshTokenKey);
  }

}