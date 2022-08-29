import 'package:flutter/material.dart';
import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../looknote_providers.dart';

class DeleteUserProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  DeleteUserProvider({required this.authApiRepository});

  bool _isClickedDropDown = false;
  bool _isChecked = false;
  String _reason = '';

  bool get isClickedDropDown => _isClickedDropDown;
  bool get isChecked => _isChecked;
  String get reason => _reason;
  bool get isValid => _isChecked && _reason.isNotEmpty;

  set isClickedDropDown(bool value) {
    _isClickedDropDown = value;
    notifyListeners();
  }

  set isChecked(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  set reason(String value) {
    _reason = value;
    notifyListeners();
  }

  Future<void> deleteUser({
    required AuthProvider authProvider,
    required SharedPreferences sharedPreferences,
  }) async {

    var response =   await authApiRepository.deleteUser(
      'Bearer ${AuthTokenHelper.getToken()}',
      {
        'reason': _reason,
      },
    );

    response.when(success: (data) async {
      await sharedPreferences.remove(SharedPreferenceKey.userToken);
      await sharedPreferences.remove(SharedPreferenceKey.appleUserToken);
      await sharedPreferences.remove(SharedPreferenceKey.kakaoUserToken);
      await sharedPreferences.remove(SharedPreferenceKey.userId);
      authProvider.userModel = null;
    }, error: (error) {

    });

  }
}
