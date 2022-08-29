import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/providers/auth/login/reset_password_provider.dart';
import 'package:looknote/providers/auth/login/user_auth_form_provider.dart';
import 'package:looknote/providers/auth/sign_up/password_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/components/button/look_note_bottom_button.dart';
import '../../../app/components/dialog/look_note_alert_dialog.dart';
import '../../../app/constants/colors.dart';
import '../../../app/resource/resource.dart';
import '../components/auth_form.dart';
import 'login_constants.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordProvider _resetPasswordProvider;
  late final PageController _pageController;
  late final UserAuthFormProvider _userAuthFormProvider;
  late final PasswordProvider _passwordProvider;

  @override
  void initState() {
    _resetPasswordProvider = context.read<ResetPasswordProvider>();
    _pageController =
        PageController(initialPage: ResetPasswordUpStep.usetAuth.index);

    _userAuthFormProvider = context.read<UserAuthFormProvider>();
    _passwordProvider = context.read<PasswordProvider>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resetPasswordProvider = context.watch<ResetPasswordProvider>();

    return Scaffold(
      appBar: LookNoteAppBar(
        title: resetPasswordTitle,
        onTap: resetPasswordProvider.pageIndex ==
            ResetPasswordUpStep.usetAuth.index
            ? () {
          resetPasswordProvider.resetData(
            userAuthFormProvider: _userAuthFormProvider,
            passwordProvider: _passwordProvider,
          );
          Navigator.pop(context);
        }
            : () =>
            _pageController.animateToPage(
              --_resetPasswordProvider.pageIndex,
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
            ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ResetPasswordUpStep.values.length,
        itemBuilder: (context, int index) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: AuthForm(
              title: resetPasswordTitles[index],
              description: resetPasswordDescriptions[index],
              child: resetPasswordForms[index],
            ),
          );
        },
      ),
      bottomNavigationBar: LookNoteBottomButton(
        title: resetPasswordProvider.pageIndex ==
            ResetPasswordUpStep.usetAuth.index
            ? nextButtonTitle
            : resetPasswordButtonTitle,
        isActive: resetPasswordProvider.stepValidation[ResetPasswordUpStep
            .values[resetPasswordProvider.pageIndex]]!,
        onPressed: resetPasswordProvider.pageIndex ==
            ResetPasswordUpStep.resetPassword.index
            ? () async {
          await _resetPasswordProvider.resetPassword(
              userAuthFormProvider: _userAuthFormProvider,
              passwordProvider: _passwordProvider);
          if (_resetPasswordProvider.checkCodeStatus ==
              'fulfilled') {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) =>
                  LookNotAlertDialog(
                    text: completedResetPassword,
                    textStyle: body1.copyWith(
                      color: LookNoteColors.black[100],
                    ),
                  ),
            ).whenComplete(() {
              _resetPasswordProvider.resetData(
                userAuthFormProvider: _userAuthFormProvider,
                passwordProvider: _passwordProvider,
              );
              Navigator.of(context).pop();
            });
          }
        }
            : () =>
            _pageController.animateToPage(
              ++_resetPasswordProvider.pageIndex,
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
            ),
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
