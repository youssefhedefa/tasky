import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocalSecureStorage{

  //static const storage = FlutterSecureStorage();
  static SharedPreferences? storage;

  static initStorage() async {
    storage = await SharedPreferences.getInstance();
  }

  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';

  static Future<void> saveAccessToken({required String token}) async {
    await storage!.setString( accessTokenKey, token);
  }

  static String getAccessToken() {
    return storage?.getString(accessTokenKey) ?? '';
  }

  static Future<void> saveRefreshToken({required String token}) async {
    await storage!.setString(refreshTokenKey,token);
  }

  static String getRefreshToken() {
    print('getting token ${storage!.getString(refreshTokenKey)}');
    return storage?.getString(refreshTokenKey) ?? '';
  }

  static Future<void> clearAll() async {
    await storage!.clear();
  }

}