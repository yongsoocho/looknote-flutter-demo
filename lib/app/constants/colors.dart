import 'package:flutter/material.dart';

const backgroundNeutral = 0xFFF5F5F5;

const black10 = 0xFFEDEDED;
const black20 = 0xFFE4E4E4;
const black40 = 0xFFADADAD;
const black100 = 0xFF000000;

const Color blackNeutral = Color(0xFFFAFAFA);

class LookNoteColors {
  LookNoteColors._();
  static const Color backgroundNeutral = Color(0xFFF5F5F5);

  static const int _blackValue = 0xFF000000;
  static const MaterialColor black = MaterialColor(
    _blackValue,
    <int, Color>{
      5: Color(0xFFF3F3F3),
      10: Color(0xFFEDEDED),
      20: Color(0xFFE4E4E4),
      40: Color(0xFFADADAD),
      60: Color(0xFF777777),
      80: Color(0xFF404040),
      90: Color(0xFF252525),
      100: Color(0xFF0A0A0A),
      500: Color(_blackValue),
    },
  );

  static const Color blackNeutral = Color(0xFFFAFAFA);

  static const int _pinkValue = 0xFFFF6FBD;
  static const MaterialColor pink = MaterialColor(
    _pinkValue,
    <int, Color>{
      20: Color(0xFFFFD5E6),
      40: Color(0xFFFFABCD),
      60: Color(0xFFFF80B4),
      100: Color(0xFFFF2C82),
      500: Color(_pinkValue),
    },
  );

  static const int _blueValue = 0xFF2962FF;
  static const MaterialColor blue = MaterialColor(
    _blueValue,
    <int, Color>{
      100: Color(0xFF0049FF),
      500: Color(_blueValue),
    },
  );

  static const Color noticeBlue = Color(0xFF2962FF);
  static const Color noticeRed = Color(0xFFFF0D0D);
  static const Color kakaoYellow = Color(0xFFFEE500);
}

const pink100 = 0xFFFF2C82;


