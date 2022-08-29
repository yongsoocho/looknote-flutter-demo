import 'package:flutter/material.dart';
import 'package:looknote/app/utils/regex.dart';


class PasswordProvider with ChangeNotifier {
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController passwordCheckEditingController = TextEditingController();

  bool _isPasswordValid = false;
  bool _isPasswordCheckValid = false;
  bool _isVisible = false;

  bool get isVisible => _isVisible;
  bool get isPasswordValid => _isPasswordValid;
  bool get isPasswordCheckValid => _isPasswordCheckValid;
  bool get isValid => _isPasswordValid && _isPasswordCheckValid;
  String get password => passwordEditingController.text;

  void toggleVisible() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      _isPasswordValid = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
      return null;
    }

    if (!passwordRegex.hasMatch(password)) {
      _isPasswordValid = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
      return '영문, 숫자, 특수문자 포함 9자 이상';
    }

    _isPasswordValid = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

    return null;
  }

  String? passwordCheckValidator(String? passwordCheck) {
    if (passwordCheck == null || passwordCheck.isEmpty) {
      _isPasswordCheckValid = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
      return null;
    }

    if (passwordEditingController.text != passwordCheck) {
      _isPasswordCheckValid = false;
      WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());
      return '비밀번호가 일치하지 않습니다.';
    }

    _isPasswordCheckValid = true;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

    return null;
  }

  void resetData() {
    passwordEditingController.clear();
    passwordCheckEditingController.clear();

    _isVisible = false;
    _isPasswordValid = false;
    _isPasswordCheckValid = false;

    notifyListeners();
  }
}
