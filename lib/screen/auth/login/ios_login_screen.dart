import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/components/button/common_long_button.dart';
import '../../../app/components/button/common_text_button.dart';
import '../../../app/components/speech_bubble/look_note_speech_bubble.dart';
import '../../../app/config/routes/routes.dart';
import '../../../app/constants/asset_path.dart';
import '../../../app/constants/colors.dart';
import '../../../app/resource/resource.dart';
import '../../../providers/auth/login/login_providers.dart';
import '../../../providers/looknote_providers.dart';
import '../terms_of_use/terms_main_screen.dart';

class IOSLoginScreen extends StatelessWidget {
  final bool isFromPreview;

  const IOSLoginScreen({
    Key? key,
    this.isFromPreview = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: horizontal16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text(
            'LookNote',
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
              color: LookNoteColors.black[100],
            ),
          ),
          const Spacer(),
          const LookNoteSpeechBubble(
            text: '3초만에 빠른 회원가입',
          ),
          size16,
          CommonLongButton(
            buttonTitle: '카카오로 계속하기',
            buttonTitleColor: LookNoteColors.black[100]!,
            buttonBackgroundColor: LookNoteColors.kakaoYellow,
            buttonLogoImage: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Image.asset(
                '${ImagePath.login}/kakao_logo.png',
                width: 18,
                height: 17,
              ),
            ),
            onPressed: () async {
              await context.read<LoginProvider>().kakaoLogin(authProvider: context.read<AuthProvider>());
              if (context.read<LoginProvider>().kakaoLoginStatus == KakaoLoginStatus.not) {
                Navigator.pushNamed(context, LookNoteRouteNames.termsOfUse, arguments: {'loginType': LoginType.kakao});
              } else if (context.read<LoginProvider>().kakaoLoginStatus == KakaoLoginStatus.already) {
                Navigator.pushNamed(context, LookNoteRouteNames.home);
              }
            },
          ),
          size10,
          CommonLongButton(
            buttonTitle: 'Apple로 계속하기',
            buttonTitleColor: LookNoteColors.black[100]!,
            buttonBackgroundColor: LookNoteColors.backgroundNeutral,
            buttonBorderColor: LookNoteColors.black[20],
            buttonLogoImage: Padding(
              padding: const EdgeInsets.only(left: 21),
              child: Image.asset(
                '${ImagePath.login}/apple_logo.png',
                width: 16,
                height: 19,
              ),
            ),
            onPressed: () async {
              await context.read<LoginProvider>().appleLogin(
                    authProvider: context.read<AuthProvider>(),
                  );
              if (context.read<LoginProvider>().appleLoginStatus == AppleLoginStatus.not) {
                Navigator.pushNamed(context, LookNoteRouteNames.termsOfUse, arguments: {'loginType': LoginType.apple});
              } else if (context.read<LoginProvider>().appleLoginStatus == AppleLoginStatus.already) {
                Navigator.pushNamed(context, LookNoteRouteNames.home);
              }
            },
          ),
          size32,
          const _OrDivider(),
          size10,
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: CommonTextButton(
                    onPressed: () => Navigator.pushNamed(context, LookNoteRouteNames.emailLogin),
                    title: '이메일로 로그인',
                    titleStyle: body2.copyWith(color: LookNoteColors.black[100]),
                  ),
                ),
                SizedBox(
                  height: 16,
                  child: VerticalDivider(
                    color: LookNoteColors.black[20],
                    width: 1,
                    thickness: 1,
                  ),
                ),
                Expanded(
                  child: CommonTextButton(
                    onPressed: () => Navigator.pushNamed(context, LookNoteRouteNames.termsOfUse, arguments: {'loginType': LoginType.email}),
                    title: '이메일로 가입',
                    titleStyle: body2.copyWith(color: LookNoteColors.black[100]),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: LookNoteColors.black[20],
            height: 1,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'or',
            style: body1.copyWith(color: LookNoteColors.black[40]),
          ),
        ),
        Expanded(
          child: Divider(
            color: LookNoteColors.black[20],
            height: 1,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
