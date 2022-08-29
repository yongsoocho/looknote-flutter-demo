import 'package:flutter/material.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/domain/use_case/auth/kakao_sign_up_use_case.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/providers/looknote_providers.dart';
import 'package:looknote/screen/auth/sign_up/kakao/kakao_sign_up_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KakaoSignUpProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;
  final KakaoSignUpUseCase useCase;
  final prefs = serviceLocator<SharedPreferences>();
  bool _success = false;
  bool get success => _success;

  KakaoSignUpProvider({
    required this.authApiRepository,
    required this.useCase,
  });

  int _pageIndex = 0;
  final Map<KaKaoSignUpStep, bool> _stepValidation = {
    KaKaoSignUpStep.username: false,
    KaKaoSignUpStep.genderAndAge: false,
  };

  int get pageIndex => _pageIndex;

  Map<KaKaoSignUpStep, bool> get stepValidation => _stepValidation;

  set pageIndex(int value) {
    _pageIndex = value;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void _setStepValidation(KaKaoSignUpStep step, bool value) {
    _stepValidation[step] = value;
    notifyListeners();
  }

  Future<void> kakaoSignUp({
    required bool isMarketingAgree,
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
    required AuthProvider authProvider,
  }) async {
    Map<String, dynamic> request = {
      'access_token': AuthTokenHelper.getKakaoToken(),
      'nickname': usernameProvider.nickname,
      'date_of_birth': genderAgeProvider.birth ?? 20000101,
      'gender': genderAgeProvider.gender ?? 'ETC',
    };

    var response = await useCase(request);
    response.when(success: (success) {
      AuthTokenHelper.setToken(success.accessToken);
      authProvider.userModel = success.user;
      _success = true;
    }, error: (error) {
      _success = false;
    });
    notifyListeners();
  }

  void update(
    UsernameProvider usernameProvider,
    GenderAgeProvider genderAgeProvider,
  ) {
    _setStepValidation(KaKaoSignUpStep.username, usernameProvider.isDuplicated);
    _setStepValidation(KaKaoSignUpStep.genderAndAge, genderAgeProvider.isValid);
  }

  void resetData({
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
    TermsOfUseProvider? termsOfUseProvider,
  }) {
    usernameProvider.resetData();
    genderAgeProvider.resetData();
    termsOfUseProvider?.resetData();

    _pageIndex = 0;
    _setStepValidation(KaKaoSignUpStep.username, false);
    _setStepValidation(KaKaoSignUpStep.genderAndAge, false);
  }
}
