import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/providers/auth/login/login_providers.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/providers/auth_provider.dart';
import 'package:looknote/providers/terms_of_use/terms_of_use_provider.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/screen/auth/components/auth_form.dart';
import 'package:looknote/app/components/app_bar/look_note_appbar.dart';
import 'package:looknote/app/components/button/look_note_bottom_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sign_up_constants.dart';

class SignUpScreen extends StatefulWidget {
  final bool isMarketingChecked;

  const SignUpScreen({
    Key? key,
    required this.isMarketingChecked,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final int _initialIndex;
  late final PageController _pageController;

  late final SignUpProvider _signUpProvider;
  late final EmailAndPasscodeProvider _emailAndPasscodeProvider;
  late final PasswordProvider _passwordProvider;
  late final UsernameProvider _usernameProvider;
  late final GenderAgeProvider _genderAgeProvider;

  late final LoginProvider _loginProvider;
  late final SharedPreferences _sharedPreferences;
  late final AuthProvider _authProvider;


  @override
  void initState() {
    _signUpProvider = context.read<SignUpProvider>();
    _loginProvider = context.read<LoginProvider>();

    _initialIndex = SignUpStep.nameAndEmail.index;

    _signUpProvider.pageIndex = _initialIndex;
    _pageController = PageController(initialPage: _signUpProvider.pageIndex);

    _emailAndPasscodeProvider = context.read<EmailAndPasscodeProvider>();
    _passwordProvider = context.read<PasswordProvider>();
    _usernameProvider = context.read<UsernameProvider>();
    _genderAgeProvider = context.read<GenderAgeProvider>();

    _sharedPreferences = serviceLocator<SharedPreferences>();
    _authProvider = context.read<AuthProvider>();



    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signUpProvider = context.watch<SignUpProvider>();
    final pageIndex = signUpProvider.pageIndex;

    return Scaffold(
      appBar: LookNoteAppBar(
        title: '회원가입',
        onTap: pageIndex == _initialIndex
            ? () {
          _signUpProvider.resetData(
            emailAndPasscodeProvider: _emailAndPasscodeProvider,
            passwordProvider: _passwordProvider,
            usernameProvider: _usernameProvider,
            genderAgeProvider: _genderAgeProvider,
          );
          Navigator.pop(context);
        }
            : () =>
            _pageController.animateToPage(
              --_signUpProvider.pageIndex,
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
            ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: SignUpStep.values.length,
        itemBuilder: (context, int index) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: AuthForm(
              title: signUpTitles[index],
              description: signUpDescriptions[index],
              child: signUpForms[index],
            ),
          );
        },
      ),
      bottomNavigationBar: LookNoteBottomButton(
        title: pageIndex == SignUpStep.genderAndAge.index ? '가입 완료' : '다음',
        isActive: signUpProvider.stepValidation[SignUpStep.values[pageIndex]]!,
        onPressed: pageIndex == SignUpStep.genderAndAge.index
            ? () async {
          await _signUpProvider.localSignUp(
            isMarketingAgree: widget.isMarketingChecked,
            emailAndPasscodeProvider: _emailAndPasscodeProvider,
            passwordProvider: _passwordProvider,
            usernameProvider: _usernameProvider,
            genderAgeProvider: _genderAgeProvider,
          );
          _loginProvider.checkActive(_emailAndPasscodeProvider.email,
              _passwordProvider.password);
          await _loginProvider.localLogin(
            sharedPreferences: _sharedPreferences,
            authProvider: _authProvider,
          );

          _signUpProvider.resetData(
            emailAndPasscodeProvider: _emailAndPasscodeProvider,
            passwordProvider: _passwordProvider,
            usernameProvider: _usernameProvider,
            genderAgeProvider: _genderAgeProvider,
            termsOfUseProvider: context.read<TermsOfUseProvider>(),
          );
          _signUpProvider.success
              ? Navigator.pushNamed(context, LookNoteRouteNames.home)
              : showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Dialog(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Text('회원가입에 실패하였습니다'),),
                );
              });
        }
            : () =>
            _pageController.animateToPage(
              ++_signUpProvider.pageIndex,
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
            ),
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
