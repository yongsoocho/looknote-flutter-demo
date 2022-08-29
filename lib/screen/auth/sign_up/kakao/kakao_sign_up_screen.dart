import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/components/app_bar/look_note_appbar.dart';
import '../../../../app/components/button/look_note_bottom_button.dart';
import '../../../../app/config/routes/routes.dart';
import '../../../../app/constants/colors.dart';
import '../../../../providers/auth/login/login_providers.dart';
import '../../../../providers/auth/sign_up/kakao_sign_up_provider.dart';
import '../../../../providers/auth/sign_up/sign_up_providers.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/terms_of_use/terms_of_use_provider.dart';
import '../../components/auth_form.dart';
import '../apple/apple_constant.dart';
import '../widgets/sign_up_widgets.dart';
import 'kakao_sign_up_constants.dart';

class KakaoSignUpScreen extends StatefulWidget {
  final bool isMarketingChecked;

  const KakaoSignUpScreen({
    Key? key,
    required this.isMarketingChecked,
  }) : super(key: key);

  @override
  State<KakaoSignUpScreen> createState() => _KakaoSignUpScreenState();
}

class _KakaoSignUpScreenState extends State<KakaoSignUpScreen> {
  late final int _initialIndex;
  late final PageController _pageController;

  late final KakaoSignUpProvider _kakaoSignUpProvider;
  late final UsernameProvider _usernameProvider;
  late final GenderAgeProvider _genderAgeProvider;

  late final LoginProvider _loginProvider;

  List<Widget> kakaoSignUpForms = const [
    UsernameForm(),
    GenderAndAgeForm(),
  ];

  @override
  void initState() {
    _kakaoSignUpProvider = context.read<KakaoSignUpProvider>();
    _loginProvider = context.read<LoginProvider>();
    _initialIndex = AppleSignUpStep.name.index;
    _kakaoSignUpProvider.pageIndex = _initialIndex;
    _pageController =
        PageController(initialPage: _kakaoSignUpProvider.pageIndex);
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
    final kakaoSignUpProvider = context.watch<KakaoSignUpProvider>();
    final pageIndex = kakaoSignUpProvider.pageIndex;
    final _authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: LookNoteAppBar(
        title: '회원가입',
        onTap: pageIndex == _initialIndex
            ? () {
                Navigator.pop(context);
              }
            : () => _pageController.animateToPage(
                  --_kakaoSignUpProvider.pageIndex,
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
              title: kakaoSignUpTitles[index],
              description: kakaoSignUpDescriptions[index],
              child: kakaoSignUpForms[index],
            ),
          );
        },
      ),
      bottomNavigationBar: LookNoteBottomButton(
        title: pageIndex == KaKaoSignUpStep.genderAndAge.index ? '가입 완료' : '다음',
        isActive: kakaoSignUpProvider
            .stepValidation[KaKaoSignUpStep.values[pageIndex]]!,
        onPressed: pageIndex == KaKaoSignUpStep.genderAndAge.index
            ? () async {
                await _kakaoSignUpProvider
                    .kakaoSignUp(
                  authProvider: _authProvider,
                  isMarketingAgree: widget.isMarketingChecked,
                  usernameProvider: _usernameProvider,
                  genderAgeProvider: _genderAgeProvider,
                )
                    .then((value) {

                  if (!_kakaoSignUpProvider.success) {

                  } else {
                    _kakaoSignUpProvider.resetData(
                      usernameProvider: _usernameProvider,
                      genderAgeProvider: _genderAgeProvider,
                      termsOfUseProvider: context.read<TermsOfUseProvider>(),
                    );
                    _loginProvider.resetData();
                    Navigator.pushNamed(context, LookNoteRouteNames.home);
                  }
                });
              }
            : () => _pageController.animateToPage(
                  ++_kakaoSignUpProvider.pageIndex,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                ),
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
