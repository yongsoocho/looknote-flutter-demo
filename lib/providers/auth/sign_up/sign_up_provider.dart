import 'package:flutter/material.dart';
import 'package:looknote/data/remote/network/model/auth/user_model.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/providers/terms_of_use/terms_of_use_provider.dart';
import 'package:looknote/screen/auth/sign_up/local/sign_up_constants.dart';


class SignUpProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  SignUpProvider({required this.authApiRepository});

  bool _success = false;
  bool get success => _success;

  int _pageIndex = 0;
  final Map<SignUpStep, bool> _stepValidation = {
    SignUpStep.nameAndEmail: false,
    SignUpStep.password: false,
    SignUpStep.username: false,
    SignUpStep.genderAndAge: false,
  };

  int get pageIndex => _pageIndex;
  Map<SignUpStep, bool> get stepValidation => _stepValidation;

  set pageIndex(int value) {
    _pageIndex = value;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void _setStepValidation(SignUpStep step, bool value) {
    _stepValidation[step] = value;
    notifyListeners();
  }

  Future<void> localSignUp({
    required bool isMarketingAgree,
    required EmailAndPasscodeProvider emailAndPasscodeProvider,
    required PasswordProvider passwordProvider,
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
  }) async {

    UserSignUpModel request = UserSignUpModel(
      name: emailAndPasscodeProvider.name,
      email: emailAndPasscodeProvider.email,
      password: passwordProvider.password,
      nickname: usernameProvider.nickname,
      dateOfBirth: genderAgeProvider.birth ?? 0,
      gender: genderAgeProvider.gender ?? 'ETC',
      height: '',
      weight: '',
    );
    final response = await authApiRepository.localSignUp(request);
    response.when(
        success: (success) async {
          _success = true;
          notifyListeners();
        },
        error: (error) {
          _success = false;
          notifyListeners();
        });
  }

  void update(
    EmailAndPasscodeProvider emailAndPasscodeProvider,
    PasswordProvider passwordProvider,
    UsernameProvider usernameProvider,
    GenderAgeProvider genderAgeProvider,
  ) {
    _setStepValidation(SignUpStep.nameAndEmail, emailAndPasscodeProvider.isValid());
    _setStepValidation(SignUpStep.password, passwordProvider.isValid);
    _setStepValidation(SignUpStep.username, usernameProvider.isDuplicated);
    _setStepValidation(SignUpStep.genderAndAge, genderAgeProvider.isValid);
  }

  void resetData({
    required EmailAndPasscodeProvider emailAndPasscodeProvider,
    required PasswordProvider passwordProvider,
    required UsernameProvider usernameProvider,
    required GenderAgeProvider genderAgeProvider,
    TermsOfUseProvider? termsOfUseProvider,
  }) {
    emailAndPasscodeProvider.resetData();
    passwordProvider.resetData();
    usernameProvider.resetData();
    genderAgeProvider.resetData();
    termsOfUseProvider?.resetData();

    _pageIndex = 0;
    _setStepValidation(SignUpStep.nameAndEmail, false);
    _setStepValidation(SignUpStep.password, false);
    _setStepValidation(SignUpStep.username, false);
    _setStepValidation(SignUpStep.genderAndAge, false);
  }
}
