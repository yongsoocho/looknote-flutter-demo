import 'package:flutter/material.dart';
import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  UserModel? userModel;


  final prefs = serviceLocator<SharedPreferences>();
   final AuthApiRepository authApiRepository;
  AuthProvider({required this.authApiRepository});
  //
  // Future<void> setFCM() async {
  //   Map<String,dynamic> body = {
  //     'device_token' : prefs.getString(SharedPreferenceKey.fCMToken)
  //   };
  //   var response = await authApiRepository.setFCM('Bearer ${AuthTokenHelper.getToken()}',body);
  //   response.when(
  //       success: (success) {
  //
  //       },
  //       error: (error) {});
  //   notifyListeners();
  // }


  Future<void> logout({required SharedPreferences sharedPreferences}) async {
    await sharedPreferences.remove(SharedPreferenceKey.userToken);
    await sharedPreferences.remove(SharedPreferenceKey.appleUserToken);
    await sharedPreferences.remove(SharedPreferenceKey.kakaoUserToken);
    await sharedPreferences.remove(SharedPreferenceKey.userId);
    userModel = null;
  }

  void updateUser({required UserModel updatedUser}) {
    userModel = updatedUser;
    notifyListeners();
  }

  bool _entryIn = false;
  bool get entryIn => _entryIn;
  set enteredIn(bool value) {
    _entryIn = value;
    prefs.setBool(SharedPreferenceKey.entryIn, value);
    notifyListeners();
  }


  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool(SharedPreferenceKey.signIn, value);
    notifyListeners();
  }

  void checkLoggedIn() {
    enteredIn = prefs.getBool(SharedPreferenceKey.entryIn) ?? false;
    loggedIn = prefs.getBool(SharedPreferenceKey.signIn)?? false;
  }

  Future<void> localTokenLogin() async {
    var response = await authApiRepository.localTokenLogin(
      'Bearer ${prefs.getString(SharedPreferenceKey.userToken)}',
    );
    response.when(success: (data) {
      userModel = data.user;
    }, error: (error) {
    });

    notifyListeners();
  }

}
