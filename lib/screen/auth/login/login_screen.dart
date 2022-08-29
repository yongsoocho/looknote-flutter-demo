import 'dart:io';
import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/screen/auth/login/android_login_screen.dart';

import 'ios_login_screen.dart';

class LoginScreen extends StatelessWidget {
  final bool isFromPreview;

  const LoginScreen({
    Key? key,
    this.isFromPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: LookNoteColors.backgroundNeutral,
        elevation: 0,
        actions: [
          Visibility(
            visible: isFromPreview,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              color: LookNoteColors.black[100],
            ),
          )
        ],
      ),
      body: Platform.isIOS ?IOSLoginScreen(isFromPreview: isFromPreview) : const AndroidLoginScreen(),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
