import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthTokenHelper {

  AuthTokenHelper._();

  static void setAppleToken(String token) {
    final prefs = serviceLocator<SharedPreferences>();
    prefs.setString(SharedPreferenceKey.appleUserToken, token);
  }

  static String getAppleToken() {
    final prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(SharedPreferenceKey.appleUserToken) ?? '';
  }


  static void setKakaoToken(String token) {
    final prefs = serviceLocator<SharedPreferences>();
    prefs.setString(SharedPreferenceKey.kakaoUserToken, token);
  }

  static String getKakaoToken() {
    final prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(SharedPreferenceKey.kakaoUserToken) ?? '';
  }

  static void setToken(String token) {
    final prefs = serviceLocator<SharedPreferences>();
    prefs.setString(SharedPreferenceKey.userToken, token);
  }


  static String getToken() {
    final prefs = serviceLocator<SharedPreferences>();
    //return 'abcdefg';
    return prefs.getString(SharedPreferenceKey.userToken) ?? '';
  }

  static void setUserId(String token) {
    final prefs = serviceLocator<SharedPreferences>();
    prefs.setString(SharedPreferenceKey.userId, token);
  }


  static String getUserId() {
    final prefs = serviceLocator<SharedPreferences>();
    return prefs.getString(SharedPreferenceKey.userId) ?? '';
  }

}