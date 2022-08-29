import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/constants/shared_preference_key.dart';
import '../../screen/auth/sign_up/local/sign_up_constants.dart';
import '../looknote_providers.dart';

class EditProfileProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  EditProfileProvider({required this.authApiRepository});

  String? _name;
  String? _gender;
  String? _birth;
  String? _selectdGender;
  String? _selectdBirth;

  String? get name => _name;

  String? get gender => _gender;

  String? get birth => _birth;

  String? get selectdGender => _selectdGender;

  String? get selectdBirth => _selectdBirth;

  set name(String? value) {
    _name = value;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  set gender(String? value) {
    _gender = value;
    _selectdGender = genderStatus[value];
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  set birth(String? value) {
    _birth = value;

    final year = value?.substring(0, 4) ?? 0;
    final month = value?.substring(4, 6) ?? 0;
    final day = value?.substring(6, 8) ?? 0;

    _selectdBirth = '$year년 $month월 $day일';

    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void selectGender(int index) {
    _gender = genderStatus.keys.toList()[index];
    _selectdGender = genderStatus.values.toList()[index];
    notifyListeners();
  }

  void selectBirth(DateTime date) {
    _birth = DateFormat('yyyyMMdd').format(date);
    _selectdBirth = DateFormat('yyyy년 MM월 dd일').format(date);

    notifyListeners();
  }

  Future<void> editProfile({
    required AuthProvider authProvider,
    required SharedPreferences sharedPreferences,
  }) async {
    final user = authProvider.userModel!;
    if (_name == user.nickname &&
        _gender == user.gender &&
        _birth == user.dateOfBirth) {
      return;
    }

    final updatedUser = user.copyWith(
     // nickname: '',
      name: _name!,
      gender: _gender!,
      dateOfBirth: int.parse(_birth!),
    );
    authProvider.updateUser(updatedUser: updatedUser);

    // update API
    final response = await authApiRepository.updateProfile(
      'Bearer ${AuthTokenHelper.getToken()}',
      {
        //'nickname' : 'dustini',
        'name': _name,
        'gender': _gender,
        'dateOfBirth': _birth,
      },
    );

    response.when(
        success: (success) {
          sharedPreferences.setString(
            SharedPreferenceKey.userToken,
            success.accessToken,
          );
        },
        error: (error) {});
  }
}
