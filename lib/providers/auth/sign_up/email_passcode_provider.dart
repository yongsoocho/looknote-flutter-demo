import 'package:flutter/material.dart';
import 'package:looknote/app/utils/regex.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';
import 'package:looknote/screen/auth/terms_of_use/terms_main_screen.dart';


enum EmailDuplicateStatus {
  notValid,
  pending,
  available,
  inUse,
}

enum CheckCodeStatus {
  pending,
  fulfilled,
  rejected,
}

class EmailAndPasscodeProvider with ChangeNotifier {

  final AuthApiRepository authApiRepository;

  EmailAndPasscodeProvider({required this.authApiRepository});

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController codeEditingController = TextEditingController();

  String? inputEmail;
  EmailDuplicateStatus _emailCheckStatus = EmailDuplicateStatus.pending;
  CheckCodeStatus _checkCodeStatus = CheckCodeStatus.pending;

  bool _isEmailValid = false;
  bool _isCodeValid = false;

  bool get isEmailValid => _isEmailValid;
  bool get isCodeValid => _isCodeValid;
  bool isValid({LoginType loginType = LoginType.email}) {
    if (loginType == LoginType.apple) {
     return  _isEmailValid && _isCodeValid;
    } else {
     return _isEmailValid && _isCodeValid && nameEditingController.text.isNotEmpty;
    }
  }

  String get name => nameEditingController.text;
  String get email => emailEditingController.text;


   Future<void> appleLoginInitValid() async {

    _isCodeValid = true;
    _isEmailValid = true;
    notifyListeners();
  }

  Future<void> checkEmailDuplicate() async {
    final email = emailEditingController.text;
    if (_emailCheckStatus == EmailDuplicateStatus.notValid || email.isEmpty) return;
    _isCodeValid = false;
    notifyListeners();


    Map<String,dynamic> request = {
      'email' : email
    };
    final response = await authApiRepository.checkEmail(request);
    response.when(
        success: (success) async {
          _isEmailValid = true;
          await authApiRepository.sendSignUpCode({'email': email});
          _emailCheckStatus = EmailDuplicateStatus.available;
          inputEmail = email;
          notifyListeners();
        },
        error: (error) {
          _isEmailValid = false;
          _emailCheckStatus = EmailDuplicateStatus.inUse;
          notifyListeners();
        });

  }

  Future<void> checkPasscode(String passcode) async {
    if (_isCodeValid || !_isEmailValid) return;

    Map<String,dynamic> request = {
      'email': email,
      'code': passcode,
    };
    final response = await authApiRepository.checkSignUpCode(request);
    response.when(
        success: (success) async {
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

    if (!emailRegex.hasMatch(email)) {
      _emailCheckStatus = EmailDuplicateStatus.notValid;
      WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

      return '이메일 형식이 올바르지 않습니다.';
    }

    if (_emailCheckStatus == EmailDuplicateStatus.inUse) {
      return '이미 사용 중인 이메일입니다.';
    }

    _emailCheckStatus = EmailDuplicateStatus.pending;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

    return null;
  }

  void nameValidator(String? name) {
    notifyListeners();
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
    _emailCheckStatus = EmailDuplicateStatus.pending;
    _checkCodeStatus = CheckCodeStatus.pending;

    _isCodeValid = false;
    _isEmailValid = false;

    notifyListeners();
  }
}
