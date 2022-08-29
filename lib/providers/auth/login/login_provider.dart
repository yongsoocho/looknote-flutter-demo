import 'package:flutter/material.dart';
import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/service/auth/apple_login.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/app/service/auth/kakao_login.dart';
import 'package:looknote/app/utils/logger.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

enum LoginStatus {
  pending,
  fail,
  success,
}

enum KakaoLoginStatus {
  already,
  not,
  ready,
}

enum AppleLoginStatus {
  already,
  not,
  ready,
}

class LoginProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;
  final SharedPreferences prefs = serviceLocator<SharedPreferences>();

  LoginProvider({
    required this.authApiRepository,
  });

  String? _email;
  String? _password;

  bool _isActive = false;

  bool get isActive => _isActive;
  LoginStatus _loginStatus = LoginStatus.pending;

  LoginStatus get loginStatus => _loginStatus;

  KakaoLoginStatus _kakaoLoginStatus = KakaoLoginStatus.ready;

  KakaoLoginStatus get kakaoLoginStatus => _kakaoLoginStatus;

  AppleLoginStatus _appleLoginStatus = AppleLoginStatus.ready;

  AppleLoginStatus get appleLoginStatus => _appleLoginStatus;

  set loginStatus(LoginStatus value) {
    _loginStatus = value;
    notifyListeners();
  }

  void checkActive(String email, String password) {
    _isActive = email.isNotEmpty && password.isNotEmpty;
    _email = email;
    _password = password;
    notifyListeners();
  }

  Future<void> appleLogin({
    required AuthProvider authProvider,
  }) async {
    await AppleLogin.signInApple();
    Map<String, dynamic> request = {
      'id_token': prefs.getString(SharedPreferenceKey.appleUserToken)!
    };
    var response = await authApiRepository.appleLogin(request);
    response.when(
        success: (success) {
          if (success.statusCode == 200) {
            AuthTokenHelper.setToken(success.data.accessToken);
            AuthTokenHelper.setUserId('${success.data.user.userId}');
            _appleLoginStatus = AppleLoginStatus.already;
            authProvider.userModel = success.data.user;
            authProvider.loggedIn = true;
          } else {

            _appleLoginStatus = AppleLoginStatus.not;
          }
        },
        error: (error) {
          _loginStatus = LoginStatus.fail;
          snackBarKey.currentState?.showSnackBar(
            errorSnackBar(error.data),
          );
        });
  }

  Future<void> kakaoLogin({
    required AuthProvider authProvider,
  }) async {
    await KakaoLogin.signInKakao();
    Map<String, dynamic> request = {
      'access_token': prefs.getString(SharedPreferenceKey.kakaoUserToken)!
    };
    var response = await authApiRepository.kakaoLogin(request);
    response.when(
        success: (success) {
          if (success.statusCode == 200) {
            _kakaoLoginStatus = KakaoLoginStatus.already;
            AuthTokenHelper.setToken(success.data.accessToken);
            AuthTokenHelper.setUserId('${success.data.user.userId}');
            authProvider.userModel = success.data.user;
            authProvider.loggedIn = true;
          } else {
            _kakaoLoginStatus = KakaoLoginStatus.not;
          }
        },
        error: (error) {
          _loginStatus = LoginStatus.fail;
          snackBarKey.currentState?.showSnackBar(
            errorSnackBar(error.data),
          );
        });
  }

  Future<void> localLogin({
    required SharedPreferences sharedPreferences,
    required AuthProvider authProvider,
  }) async {
    Map<String, dynamic> request = {
      'email': _email,
      'password': _password,
    };

    var response = await authApiRepository.localLogin(request);
    response.when(success: (data) {
      _loginStatus = LoginStatus.success;
      sharedPreferences.setString(
        SharedPreferenceKey.userToken,
        data.accessToken,
      );
      sharedPreferences.setString(
        SharedPreferenceKey.userId,
        '${data.user.userId}',
      );

      authProvider.userModel = data.user;
      notifyListeners();
    }, error: (error) {
      _loginStatus = LoginStatus.fail;
      snackBarKey.currentState?.showSnackBar(
          errorSnackBar(error.data));
      notifyListeners();
    });
  }

  Future<void> localTokenLogin({
    required SharedPreferences sharedPreferences,
    required AuthProvider authProvider,
  }) async {
    var response = await authApiRepository.localTokenLogin(
      'Bearer ${prefs.getString(SharedPreferenceKey.userToken)}',
    );
    response.when(success: (data) {
      authProvider.userModel = data.user;
      _loginStatus = LoginStatus.success;
    }, error: (error) {
      _loginStatus = LoginStatus.fail;
    });

    notifyListeners();
  }

  void resetData() {
    _email = null;
    _password = null;
    _loginStatus = LoginStatus.pending;
    _isActive = false;
  }
}
