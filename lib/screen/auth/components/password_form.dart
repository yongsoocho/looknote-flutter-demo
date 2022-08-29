import 'package:flutter/material.dart';
import 'package:looknote/app/constants/asset_path.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/screen/auth/components/auth_widgets.dart';
import 'package:provider/provider.dart';


class PasswordForm extends StatefulWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  late final PasswordProvider _passwordProvider;
  late final TextEditingController _passwordEditingController;
  late final TextEditingController _passwordCheckEditingController;

  @override
  void initState() {
    _passwordProvider = context.read<PasswordProvider>();

    _passwordEditingController = TextEditingController(text: _passwordProvider.passwordEditingController.text);
    _passwordCheckEditingController = TextEditingController(text: _passwordProvider.passwordCheckEditingController.text);

    _passwordProvider.passwordEditingController = _passwordEditingController;
    _passwordProvider.passwordCheckEditingController = _passwordCheckEditingController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passwordProvider = context.watch<PasswordProvider>();

    return Column(
      children: [
        const SizedBox(height: 88),
        AuthTextFormField(
          controller: _passwordEditingController,
          validator: _passwordProvider.passwordValidator,
          isValid: passwordProvider.isPasswordValid,
          hintText: '비밀번호',
          validText: '영문, 숫자, 특수문자 포함 9자 이상',
          helperText: '영문, 숫자, 특수문자 포함 9자 이상',
          obscureText: !passwordProvider.isVisible,
          suffix: IconButton(
            onPressed: _passwordProvider.toggleVisible,
            icon: Image.asset(
              '${ImagePath.signup}/password_hide.png',
              width: 22,
              height: 22,
            ),
            iconSize: 22,
            constraints: const BoxConstraints(),
            splashRadius: 1,
          ),
        ),
        const SizedBox(height: 10),
        AuthTextFormField(
          controller: _passwordCheckEditingController,
          validator: _passwordProvider.passwordCheckValidator,
          isValid: passwordProvider.isPasswordCheckValid,
          hintText: '비밀번호 확인',
          validText: '비밀번호가 일치합니다.',
          obscureText: !passwordProvider.isVisible,
        ),
      ],
    );
  }
}
