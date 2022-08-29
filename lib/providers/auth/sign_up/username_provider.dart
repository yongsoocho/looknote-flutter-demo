import 'package:flutter/material.dart';
import 'package:looknote/app/utils/regex.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';


enum UsernameDuplicateStatus {
  pending,
  available,
  inUse,
}

class UsernameProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;

  UsernameProvider({required this.authApiRepository});

  TextEditingController usernameEditingController = TextEditingController();

  String? inputUsername;
  UsernameDuplicateStatus _usernameCheckStatus = UsernameDuplicateStatus.pending;
  bool _isDuplicated = false;
  bool get isDuplicated => _isDuplicated && inputUsername == usernameEditingController.text;


   bool _isValid = false;
   bool get isValid => _isValid;




  String get nickname => usernameEditingController.text;

  Future<void> checkNicknameDuplicate() async {
    final nickname = usernameEditingController.text;
    if (nickname.isEmpty) return;

    Map<String,dynamic> request = {
      'nickname': nickname
    };
    final response = await authApiRepository.checkNickname(request);
    response.when(
        success: (success) async {
          _isDuplicated = true;
          _usernameCheckStatus = UsernameDuplicateStatus.available;
          inputUsername = nickname;
          notifyListeners();
        },
        error: (error) {
          _isDuplicated = false;
          _usernameCheckStatus = UsernameDuplicateStatus.inUse;
          notifyListeners();
        });

  }

  void validateNickname(String? val) {
    if (val != null && val.isValidNickname) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }

  String? usernameValidator(String? username) {
    if (username != null && username.isValidNickname) {
      _isValid = true;
    } else {
      _isValid = false;
      _isDuplicated = false;
    }

    if (_usernameCheckStatus == UsernameDuplicateStatus.inUse) {
      return '이미 사용 중인 닉네임입니다.';
    }

    _usernameCheckStatus = UsernameDuplicateStatus.pending;
    WidgetsBinding.instance!.addPostFrameCallback((_) => notifyListeners());

    return null;
  }

  void resetData() {
    usernameEditingController.clear();
    _isDuplicated = false;

    notifyListeners();
  }
}
