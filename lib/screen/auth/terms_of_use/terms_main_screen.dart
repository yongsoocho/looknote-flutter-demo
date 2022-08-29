import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/components/button/look_note_bottom_button.dart';
import '../../../app/config/routes/routes.dart';
import '../../../app/constants/colors.dart';
import '../../../app/resource/fonts.dart';
import '../../../providers/terms_of_use/terms_of_use_provider.dart';
import 'terms_of_use_constants.dart';
import 'widgets/terms_of_use_widgets.dart';

enum LoginType { apple, kakao, email }

class TermsMainScreen extends StatelessWidget {
  final LoginType loginType;

  const TermsMainScreen({
    Key? key,
    this.loginType = LoginType.kakao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final termsOfUseProvider = context.watch<TermsOfUseProvider>();

    List<bool> _termsOfChecked = [
      termsOfUseProvider.isPrivateChecked,
      termsOfUseProvider.isAgeChecked,
      termsOfUseProvider.isMarketingChecked,
    ];

    return Scaffold(
      appBar: LookNoteAppBar(
        title: '회원가입',
        onTap: () {
          termsOfUseProvider.resetData();
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 48.0),
            Text(
              '약관 동의',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: LookNoteColors.black[90],
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '회원가입을 위해 우선 필수항목 및 선택항목\n약관에 동의해 주세요.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: LookNoteColors.black[80],
              ),
            ),
            const SizedBox(height: 33.0),
            const AgreeAllTermsContainer(),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AgreeTermsContainer(
                  terms: termsOfUse[index],
                  isChecked: _termsOfChecked[index],
                  onChanged: (bool? value) => _onChanged(
                    context,
                    value: value,
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 0),
              itemCount: _termsOfChecked.length,
            ),
            const _AgeTerms()
          ],
        ),
      ),
      bottomNavigationBar: LookNoteBottomButton(
          isActive: termsOfUseProvider.isPrivateChecked && termsOfUseProvider.isAgeChecked,
          onPressed: () {
            if (loginType == LoginType.apple) {
              Navigator.pushNamed(
                context,
                LookNoteRouteNames.appleSignUp,
                arguments: {
                  'isMarketingChecked': termsOfUseProvider.isMarketingChecked,
                },
              );
            } else if (loginType == LoginType.kakao) {
              Navigator.pushNamed(
                context,
                LookNoteRouteNames.kakaoSignUp,
                arguments: {
                  'isMarketingChecked': termsOfUseProvider.isMarketingChecked,
                  'loginType': loginType,
                },
              );
            } else {
              Navigator.pushNamed(
                context,
                LookNoteRouteNames.signUp,
                arguments: {
                  'isMarketingChecked': termsOfUseProvider.isMarketingChecked,
                  'loginType': loginType,
                },
              );
            }
          }),
      // bottomNavigationBar: const _BottomButton(),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }

  void _onChanged(
    BuildContext context, {
    bool? value,
    required int index,
  }) {
    final termsOfUseProvider = context.read<TermsOfUseProvider>();
    if (value != null) {
      switch (index) {
        case 0:
          termsOfUseProvider.isPrivateChecked = value;

          break;
        case 1:
          termsOfUseProvider.isAgeChecked = value;

          break;
        case 2:
          termsOfUseProvider.isMarketingChecked = value;
          break;
      }
      termsOfUseProvider.isEntireChecked = termsOfUseProvider.isPrivateChecked && termsOfUseProvider.isAgeChecked && termsOfUseProvider.isMarketingChecked;
    }
  }
}

class _AgeTerms extends StatelessWidget {
  const _AgeTerms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 50),
        Text(
          '만 14세 이상 가입 가능합니다.',
          style: body1.copyWith(
            color: LookNoteColors.black[60],
            decoration: TextDecoration.underline,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => Navigator.pushNamed(
            context,
            LookNoteRouteNames.terms,
            arguments: {
              'title': termsOfUse.last.title,
              'url': termsOfUse.last.url,
            },
          ),
          icon: const Icon(Icons.arrow_forward_ios),
          iconSize: 18,
          splashRadius: 1,
          color: LookNoteColors.black[60],
        ),
      ],
    );
  }
}
