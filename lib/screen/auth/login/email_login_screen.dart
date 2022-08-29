import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/components/dialog/look_note_alert_dialog.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/app/resource/strings.dart';
import 'package:looknote/providers/auth/login/login_providers.dart';
import 'package:looknote/providers/auth_provider.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/screen/auth/components/auth_form.dart';
import 'package:looknote/app/components/app_bar/look_note_appbar.dart';
import 'package:looknote/app/components/button/look_note_bottom_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/login_widgets.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  late final LoginProvider _loginProvider;

  @override
  void initState() {
    _loginProvider = context.read<LoginProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    return Scaffold(
      appBar: LookNoteAppBar(
        title: '',
        onTap: () => Navigator.pop(context),
      ),
      body: const SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: AuthForm(
          title: loginTitle,
          description: loginDescription,
          child: EmailLoginForm(),
        ),
      ),
      bottomNavigationBar: LookNoteBottomButton(
        title: loginTitle,
        isActive: loginProvider.isActive,
        onPressed: () async {
          await _loginProvider.localLogin(
            sharedPreferences: serviceLocator<SharedPreferences>(),
            authProvider: context.read<AuthProvider>(),
          );

          if (loginProvider.loginStatus == LoginStatus.fail) {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => LookNotAlertDialog(text: logInFail, textStyle: body1.copyWith(color: LookNoteColors.noticeRed)),
            );
            _loginProvider.loginStatus = LoginStatus.pending;
            return;
          } else if (loginProvider.loginStatus == LoginStatus.success) {
            _loginProvider.loginStatus = LoginStatus.pending;
            _loginProvider.resetData();
            Navigator.pushNamed(context, LookNoteRouteNames.home);
          }
        },
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
