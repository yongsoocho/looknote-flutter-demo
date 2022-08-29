import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';


String get getToken {
  String token;
  final sharedPreference = serviceLocator<SharedPreferences>();
  token = sharedPreference.getString(SharedPreferenceKey.userToken)!;
  return token;
}
