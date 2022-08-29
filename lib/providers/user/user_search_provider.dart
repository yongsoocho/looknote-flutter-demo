import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';

class UserSearchProvider with ChangeNotifier {
  final AuthApiRepository authApiRepository;
  UserSearchProvider({required this.authApiRepository});

  UserModel? userModel;

  String? _search;

  String? get search => _search;


  Future<void> searchUser() async {
    Map<String, dynamic> body = {'nickname': _search };

    var response = await authApiRepository.userSearch(body);

    response.when(success: (success) {
      userModel = success.data;


    }, error: (error) {});
    notifyListeners();
  }

  void validationSearch(String? val) {
    if (val != null) {
      _search = val;
    } else {
      _search = null;
    }
    notifyListeners();
  }
}
