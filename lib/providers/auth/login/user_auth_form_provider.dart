import 'package:flutter/material.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';


enum EmailCheckStatus {
  pending,
  available,
  inUse,
}

class UserAuthFormProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  UserAuthFormProvider({required this.authApiRepository});

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController codeEditingController = TextEditingController();

  String? inputEmail;
  String? authPasscode;
  EmailCheckStatus _emailCheckStatus = EmailCheckStatus.pending;
  CheckCodeStatus _checkCodeStatus = CheckCodeStatus.pending;
  bool _isEmailValid = false;
  bool _isCodeValid = false;

  bool get isEmailValid => _isEmailValid;
  bool get isCodeValid => _isCodeValid;
  bool get isValid => _isEmailValid && _isCodeValid && nameEditingController.text.isNotEmpty && inputEmail == emailEditingController.text;

  Future<void> checkUserEmail() async {
    final email = emailEditingController.text;
    if (email.isEmpty) return;
    _isCodeValid = false;
    notifyListeners();

    Map<String,dynamic> request = {
      'email' : email
    };
    final response = await authApiRepository.checkEmail(request);
    response.when(
        success: (success) async {
          _isEmailValid = false;
          _emailCheckStatus = EmailCheckStatus.available;
          notifyListeners();
        },
        error: (error) async {
          _isEmailValid = true;
          _emailCheckStatus = EmailCheckStatus.inUse;
          await authApiRepository.sendFindPasscode({'email': email});
          inputEmail = email;
          notifyListeners();
        });
  }

  Future<void> checkPasscode(String passcode) async {
    if (_isCodeValid || !_isEmailValid) return;

    Map<String,dynamic> request = {
      'email': inputEmail,
      'code': passcode,
    };
    final response = await authApiRepository.checkFindPasswordCode(request);
    response.when(
        success: (success) async {
          authPasscode = passcode;
          _isCodeValid = true;
          _checkCodeStatus = CheckCodeStatus.fulfilled;
          notifyListeners();
        },
        error: (error) {
          _isCodeValid = false;
          _checkCodeStatus = CheckCodeStatus.rejected;
          notifyListeners();
        });
  }

  String? emailValidator(String? email) {
    if (email == null) return null;

    if (_emailCheckStatus == EmailCheckStatus.available) {
      return '회원정보가 일치하지 않거나 존재하지 않습니다';
    }

    _emailCheckStatus = EmailCheckStatus.pending;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

    return null;
  }

  String? codeValidator(String? code) {
    if (code == null || _checkCodeStatus == CheckCodeStatus.pending) return null;

    if (_checkCodeStatus == CheckCodeStatus.rejected) return '인증번호가 일치하지 않습니다.';

    return null;
  }

  void resetData() {
    nameEditingController.clear();
    emailEditingController.clear();
    codeEditingController.clear();

    inputEmail = null;
    _emailCheckStatus = EmailCheckStatus.pending;
    _checkCodeStatus = CheckCodeStatus.pending;

    _isCodeValid = false;
    _isEmailValid = false;

    notifyListeners();
  }
}
