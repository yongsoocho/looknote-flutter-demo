import 'package:flutter/material.dart';

class TermsOfUseProvider with ChangeNotifier {
  bool _isEntireChecked = false;
  bool _isPrivateChecked = false;
  bool _isAgeChecked = false;
  bool _isMarketingChecked = false;

  bool get isEntireChecked => _isEntireChecked;
  bool get isPrivateChecked => _isPrivateChecked;
  bool get isAgeChecked => _isAgeChecked;
  bool get isMarketingChecked => _isMarketingChecked;

  set isEntireChecked(bool value) {
    _isEntireChecked = value;
    notifyListeners();
  }

  set isPrivateChecked(bool value) {
    _isPrivateChecked = value;

    notifyListeners();
  }

  set isAgeChecked(bool value) {
    _isAgeChecked = value;
    notifyListeners();
  }

  set isMarketingChecked(bool value) {
    _isMarketingChecked = value;
    notifyListeners();
  }

  void resetData() {
    _isEntireChecked = false;
    _isPrivateChecked = false;
    _isAgeChecked = false;
    _isMarketingChecked = false;

    notifyListeners();
  }
}
