import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/screen/auth/components/auth_suffix_button.dart';
import 'package:looknote/screen/auth/components/auth_text_form_field.dart';
import 'package:provider/provider.dart';

class UsernameForm extends StatefulWidget {
  const UsernameForm({Key? key}) : super(key: key);

  @override
  State<UsernameForm> createState() => _UsernameFormState();
}

class _UsernameFormState extends State<UsernameForm> {
  late final UsernameProvider _usernameProvider;
  late final TextEditingController _usernameEditingController;

  @override
  void initState() {
    _usernameProvider = context.read<UsernameProvider>();

    _usernameEditingController = TextEditingController(
        text: _usernameProvider.usernameEditingController.text);
    _usernameProvider.usernameEditingController = _usernameEditingController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usernameProvider = context.watch<UsernameProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 36),
        Text(
          '15자 이내로 영어 소문자, 숫자, 언더바(_) 사용 가능',
          style: subTitle3.copyWith(
              color: usernameProvider.isValid
                  ? LookNoteColors.black
                  : LookNoteColors.noticeRed),
        ),
        const SizedBox(height: 6),
        AuthTextFormField(
          controller: _usernameEditingController,
          validator: _usernameProvider.usernameValidator,
          isValid: usernameProvider.isValid,
          hintText: '',
          validText: _usernameProvider.isDuplicated ? '사용 가능한 닉네임입니다.' : '',
          suffix: AuthSuffixButton(
            onPressed: () {
              if (usernameProvider.isValid) {
                _usernameProvider.checkNicknameDuplicate();
                FocusScope.of(context).unfocus();
              }
            },
            text: '중복 확인',
          ),
        ),
      ],
    );
  }
}
