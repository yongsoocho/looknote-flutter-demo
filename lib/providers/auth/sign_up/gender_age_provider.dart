import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:looknote/screen/auth/sign_up/local/sign_up_constants.dart';

class GenderAgeProvider with ChangeNotifier {
  String? _gender;
  int? _birth;
  String? _selectdGender;
  String? _selectdBirth;

  String? get gender => _gender;
  int? get birth => _birth;
  String? get selectdGender => _selectdGender;
  String? get selectdBirth => _selectdBirth;
  bool get isValid => true;

  void selectGender(int index) {
    _gender = genderStatus.keys.toList()[index];
    _selectdGender = genderStatus.values.toList()[index];
    notifyListeners();
  }

  void selectBirth(DateTime date) {
    _birth = int.parse(DateFormat('yyyyMMdd').format(date));
    _selectdBirth = DateFormat('yyyy년 MM월 dd일').format(date);


    notifyListeners();
  }

  void resetData() {
    _gender = null;
    _birth = null;
    _selectdGender = null;
    _selectdBirth = null;

    notifyListeners();
  }
}
