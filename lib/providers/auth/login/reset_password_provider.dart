import 'package:flutter/material.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/providers/auth/login/user_auth_form_provider.dart';
import 'package:looknote/screen/auth/login/login_constants.dart';

import '../sign_up/password_provider.dart';


class ResetPasswordProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  ResetPasswordProvider({required this.authApiRepository});

  String get checkCodeStatus => _checkCodeStatus;
  String _checkCodeStatus = 'pending';

  int _pageIndex = 0;
  final Map<ResetPasswordUpStep, bool> _stepValidation = {
    ResetPasswordUpStep.usetAuth: false,
    ResetPasswordUpStep.resetPassword: false,
  };

  int get pageIndex => _pageIndex;
  Map<ResetPasswordUpStep, bool> get stepValidation => _stepValidation;

  set pageIndex(int value) {
    _pageIndex = value;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
  }

  void _setStepValidation(ResetPasswordUpStep step, bool value) {
    _stepValidation[step] = value;
    notifyListeners();
  }

  Future<void> resetPassword({
    required UserAuthFormProvider userAuthFormProvider,
    required PasswordProvider passwordProvider,
  }) async {

    Map<String,dynamic> request = {
      'email': userAuthFormProvider.inputEmail,
      'password': passwordProvider.password,
      'code': userAuthFormProvider.authPasscode,
    };
    final response = await authApiRepository.resetPassword(request);
    response.when(
        success: (success) async {
          _checkCodeStatus = success.data;
          notifyListeners();
        },
        error: (error) {
          _checkCodeStatus = 'rejected';
          notifyListeners();
        });
  }

  void update(
    UserAuthFormProvider userAuthFormProvider,
    PasswordProvider passwordProvider,
  ) {
    _setStepValidation(ResetPasswordUpStep.usetAuth, userAuthFormProvider.isValid);
    _setStepValidation(ResetPasswordUpStep.resetPassword, passwordProvider.isValid);
  }

  void resetData({
    required UserAuthFormProvider userAuthFormProvider,
    required PasswordProvider passwordProvider,
  }) {
    userAuthFormProvider.resetData();
    passwordProvider.resetData();

    _pageIndex = 0;
    _setStepValidation(ResetPasswordUpStep.usetAuth, false);
    _setStepValidation(ResetPasswordUpStep.resetPassword, false);
  }
}
