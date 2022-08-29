import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/components/app_bar/look_note_appbar.dart';
import '../../../../app/components/button/look_note_bottom_button.dart';
import '../../../../app/config/routes/routes.dart';
import '../../../../app/constants/colors.dart';
import '../../../../providers/auth/login/login_providers.dart';
import '../../../../providers/auth/sign_up/apple_sign_up_provider.dart';
import '../../../../providers/auth/sign_up/sign_up_providers.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/terms_of_use/terms_of_use_provider.dart';
import '../../components/auth_form.dart';
import '../../terms_of_use/terms_main_screen.dart';
import '../widgets/sign_up_widgets.dart';
import 'apple_constant.dart';

class AppleSignUpScreen extends StatefulWidget {
  final bool isMarketingChecked;

  const AppleSignUpScreen({
    Key? key,
    required this.isMarketingChecked,
  }) : super(key: key);

  @override
  State<AppleSignUpScreen> createState() => _AppleSignUpScreenState();
}

class _AppleSignUpScreenState extends State<AppleSignUpScreen> {
  late final int _initialIndex;
  late final PageController _pageController;

  late final AppleSignUpProvider _appleSignUpProvider;
  late final EmailAndPasscodeProvider _emailAndPasscodeProvider;
  late final UsernameProvider _usernameProvider;
  late final GenderAgeProvider _genderAgeProvider;

  late final LoginProvider _loginProvider;

  List<Widget> appleSignUpForms = const [
    NameAndEmailForm(
      loginType: LoginType.apple,
    ),
    UsernameForm(),
    GenderAndAgeForm(),
  ];

  @override
  void initState() {
    _appleSignUpProvider = context.read<AppleSignUpProvider>();
    _loginProvider = context.read<LoginProvider>();
    _initialIndex = AppleSignUpStep.name.index;
    _appleSignUpProvider.pageIndex = _initialIndex;
    _pageController =
        PageController(initialPage: _appleSignUpProvider.pageIndex);

    _emailAndPasscodeProvider = context.read<EmailAndPasscodeProvider>();
    _usernameProvider = context.read<UsernameProvider>();
    _genderAgeProvider = context.read<GenderAgeProvider>();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appleSignUpProvider = context.watch<AppleSignUpProvider>();
    final pageIndex = appleSignUpProvider.pageIndex;
    final _authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: LookNoteAppBar(
        title: '회원가입',
        onTap: pageIndex == _initialIndex
            ? () {
                Navigator.pop(context);
              }
            : () => _pageController.animateToPage(
                  --_appleSignUpProvider.pageIndex,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                ),
      ),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AppleSignUpStep.values.length,
        itemBuilder: (context, int index) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: AuthForm(
              title: appleSignUpTitles[index],
              description: appleSignUpDescriptions[index],
              child: appleSignUpForms[index],
            ),
          );
        },
      ),
      bottomNavigationBar: LookNoteBottomButton(
        title: pageIndex == AppleSignUpStep.genderAndAge.index ? '가입 완료' : '다음',
        isActive: appleSignUpProvider
            .stepValidation[AppleSignUpStep.values[pageIndex]]!,
        onPressed: pageIndex == AppleSignUpStep.genderAndAge.index
            ? () async {
                await _appleSignUpProvider.appleSignUp(
                  authProvider: _authProvider,
                  isMarketingAgree: widget.isMarketingChecked,
                  usernameProvider: _usernameProvider,
                  genderAgeProvider: _genderAgeProvider,
                  emailAndPasscodeProvider: _emailAndPasscodeProvider,
                );
                if (!_appleSignUpProvider.success) {
                } else {
                  _appleSignUpProvider.resetData(
                    emailAndPasscodeProvider: _emailAndPasscodeProvider,
                    usernameProvider: _usernameProvider,
                    genderAgeProvider: _genderAgeProvider,
                    termsOfUseProvider: context.read<TermsOfUseProvider>(),
                  );
                  _loginProvider.resetData();
                  Navigator.pushNamed(context, LookNoteRouteNames.home);
                }
              }
            : () => _pageController.animateToPage(
                  ++_appleSignUpProvider.pageIndex,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                ),
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
