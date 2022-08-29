import 'package:flutter/material.dart';
import 'package:looknote/providers/auth/login/user_auth_form_provider.dart';
import 'package:looknote/screen/auth/components/auth_suffix_button.dart';
import 'package:looknote/screen/auth/components/auth_text_form_field.dart';
import 'package:provider/provider.dart';

class UserAuthForm extends StatefulWidget {
  const UserAuthForm({Key? key}) : super(key: key);

  @override
  State<UserAuthForm> createState() => _UserAuthFormState();
}

class _UserAuthFormState extends State<UserAuthForm> {
  late final UserAuthFormProvider _userAuthFormProvider;
  late final TextEditingController _nameEditingController;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _codeEditingController;

  @override
  void initState() {
    _userAuthFormProvider = context.read<UserAuthFormProvider>();

    _nameEditingController = TextEditingController(text: _userAuthFormProvider.nameEditingController.text);
    _emailEditingController = TextEditingController(text: _userAuthFormProvider.emailEditingController.text);
    _codeEditingController = TextEditingController(text: _userAuthFormProvider.codeEditingController.text);

    _userAuthFormProvider.nameEditingController = _nameEditingController;
    _userAuthFormProvider.emailEditingController = _emailEditingController;
    _userAuthFormProvider.codeEditingController = _codeEditingController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAuthFormProvider = context.watch<UserAuthFormProvider>();

    return Column(
      children: [
        const SizedBox(height: 88),
        AuthTextFormField(
          controller: _nameEditingController,
          isValid: true,
          hintText: '이름',
        ),
        const SizedBox(height: 10),
        AuthTextFormField(
          controller: _emailEditingController,
          validator: _userAuthFormProvider.emailValidator,
          isValid: userAuthFormProvider.isEmailValid,
          hintText: '아이디 (이메일)',
          suffix: AuthSuffixButton(
            onPressed: () {
              _userAuthFormProvider.checkUserEmail();
              FocusScope.of(context).unfocus();
            },
            text: '인증번호 전송',
          ),
          validText: '인증번호가 전송되었습니다.',
        ),
        const SizedBox(height: 10),
        AuthTextFormField(
          controller: _codeEditingController,
          validator: _userAuthFormProvider.codeValidator,
          isValid: userAuthFormProvider.isCodeValid,
          hintText: '인증번호',
          suffix: AuthSuffixButton(
            onPressed: () {
              _userAuthFormProvider.checkPasscode(_codeEditingController.text);
              FocusScope.of(context).unfocus();
            },
            text: !userAuthFormProvider.isCodeValid ? '인증번호 확인' : '인증 완료',
            isActive: !userAuthFormProvider.isCodeValid,
          ),
        ),
      ],
    );
  }
}
