import 'package:flutter/material.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/main.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/providers/auth_provider.dart';
import 'package:looknote/providers/terms_of_use/terms_of_use_provider.dart';
import 'package:looknote/screen/auth/sign_up/apple/apple_constant.dart';
import 'package:looknote/screen/auth/terms_of_use/terms_main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppleSignUpProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;
  final prefs = serviceLocator<SharedPreferences>();

  AppleSignUpProvider({required this.authApiRepository});

  bool _success = false;
  bool get success => _success;

  int _pageIndex = 0;
  final Map<AppleSignUpStep, bool> _stepValidation = {
    AppleSignUpStep.name: false,
    AppleSignUpStep.username: false,
    AppleSignUpStep.genderAndAge: false,
  };

  int get pageIndex => _pageIndex;

  Map<AppleSignUpStep, bool> get stepValidation => _stepValidation;

  set pageIndex(int value) {
    _pageIndex = value;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void _setStepValidation(AppleSignUpStep step, bool value) {
    _stepValidation[step] = value;
    notifyListeners();
  }

  Future<void> appleSignUp({
    required bool isMarketingAgree,
    required EmailAndPasscodeProvider emailAndPasscodeProvider,
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
    required AuthProvider authProvider,
  }) async {
    String _name = emailAndPasscodeProvider.name;
    if (emailAndPasscodeProvider.name == '') {
      _name = '알수 없음';
    }

    Map<String, dynamic> request = {
      'id_token': AuthTokenHelper.getAppleToken(),
      'name': _name,
      'nickname': usernameProvider.nickname,
      'date_of_birth': genderAgeProvider.birth ?? 0,
      'gender': genderAgeProvider.gender ?? 'ETC',
    };

    var response = await authApiRepository.appleSignUp(request);
    response.when(
        success: (success) {
          AuthTokenHelper.setToken(success.accessToken);
          authProvider.userModel = success.user;
          _success = true;
        },
        error: (error) {
          _success = false;
          snackBarKey.currentState?.showSnackBar(
            errorSnackBar(error.data),
          );

        });
  }

  void update(
    EmailAndPasscodeProvider emailAndPasscodeProvider,
    UsernameProvider usernameProvider,
    GenderAgeProvider genderAgeProvider,
  ) {
    _setStepValidation(AppleSignUpStep.name,
        emailAndPasscodeProvider.isValid(loginType: LoginType.apple));
    _setStepValidation(AppleSignUpStep.username, usernameProvider.isDuplicated);
    _setStepValidation(AppleSignUpStep.genderAndAge, genderAgeProvider.isValid);
  }

  void resetData({
    required EmailAndPasscodeProvider emailAndPasscodeProvider,
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
    TermsOfUseProvider? termsOfUseProvider,
  }) {
    emailAndPasscodeProvider.resetData();
    usernameProvider.resetData();
    genderAgeProvider.resetData();
    termsOfUseProvider?.resetData();

    _pageIndex = 0;
    _setStepValidation(AppleSignUpStep.name, false);
    _setStepValidation(AppleSignUpStep.username, false);
    _setStepValidation(AppleSignUpStep.genderAndAge, false);
  }
}
