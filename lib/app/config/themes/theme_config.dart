


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Color background
  }) {
    return ThemeData(
      backgroundColor: background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
      //canvasColor: background,
      //cardColor: background,

    );
  }

  static ThemeData get lightTheme => createTheme(
    background: Colors.white,
  );


}