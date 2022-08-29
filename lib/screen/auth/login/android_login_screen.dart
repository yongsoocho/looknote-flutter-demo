import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/resource.dart';
import 'package:looknote/screen/auth/components/auth_text_form_field.dart';
import 'widgets/login_widgets.dart';

class AndroidLoginScreen extends StatelessWidget {
  const AndroidLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontal24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'LookNote',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.w700,
              fontSize: 40.0,
              color: LookNoteColors.black[100],
            ),
          ),
          const _LoginTextFormFields(),
          LoginElevatedButton(
            onPressed: () {},
            child: Text(
              '로그인',
              style: button1.copyWith(color: Colors.white),
            ),
          ),
          size12,
          LoginElevatedButton(
            onPressed: () {},
            child: Text(
              '회원가입',
              style: button1.copyWith(
                color: LookNoteColors.black[100],
              ),
            ),
            primaryColor: LookNoteColors.backgroundNeutral,
          ),
          size12,
          size20,
          LoginTextButton(
            onPressed: () {},
            text: '비밀번호를 잊으셨나요?',
            textStyle: subTitle3.copyWith(
              color: LookNoteColors.black[60],
            ),
          ),
          const Visibility(
            visible: true,
            child: AppPreview(),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _LoginTextFormFields extends StatelessWidget {
  const _LoginTextFormFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        size40,
        AuthTextFormField(
          isValid: true,
          hintText: loginTextFieldHint,
        ),
        size20,
        AuthTextFormField(
          isValid: true,
          obscureText: true,
          hintText: passwordTextFieldHint,
        ),
        size20
      ],
    );
  }
}
