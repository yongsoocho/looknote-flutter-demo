import 'package:flutter/material.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/screen/auth/components/auth_suffix_button.dart';
import 'package:looknote/screen/auth/components/auth_text_form_field.dart';
import 'package:looknote/screen/auth/terms_of_use/terms_main_screen.dart';
import 'package:provider/provider.dart';

class NameAndEmailForm extends StatefulWidget {
  const NameAndEmailForm({Key? key, this.loginType = LoginType.email})
      : super(key: key);

  final LoginType loginType;

  @override
  State<NameAndEmailForm> createState() => _NameAndEmailFormState();
}

class _NameAndEmailFormState extends State<NameAndEmailForm> {
  late final EmailAndPasscodeProvider _emailAndPasscodeProvider;
  late final TextEditingController _nameEditingController;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _codeEditingController;

  @override
  void initState() {
    _emailAndPasscodeProvider = context.read<EmailAndPasscodeProvider>();

    _nameEditingController = TextEditingController(
        text: _emailAndPasscodeProvider.nameEditingController.text);
    _emailEditingController = TextEditingController(
        text: _emailAndPasscodeProvider.emailEditingController.text);
    _codeEditingController = TextEditingController(
        text: _emailAndPasscodeProvider.codeEditingController.text);

    _emailAndPasscodeProvider.nameEditingController = _nameEditingController;
    _emailAndPasscodeProvider.emailEditingController = _emailEditingController;
    _emailAndPasscodeProvider.codeEditingController = _codeEditingController;

    Future.microtask(() async {
      if (widget.loginType == LoginType.apple) {
        await _emailAndPasscodeProvider.appleLoginInitValid();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailAndPasscodeProvider = context.watch<EmailAndPasscodeProvider>();

    return Column(
      children: [
        const SizedBox(height: 88),
        AuthTextFormField(
            controller: _nameEditingController,
            isValid: true,
            hintText: '??????',
            onFieldSubmitted: _emailAndPasscodeProvider.nameValidator),
        const SizedBox(height: 10),
        Visibility(
          visible: (widget.loginType == LoginType.email),
          child: AuthTextFormField(
            controller: _emailEditingController,
            validator: _emailAndPasscodeProvider.emailValidator,
            isValid: emailAndPasscodeProvider.isEmailValid,
            hintText: '????????? (?????????)',
            validText: '??????????????? ?????????????????????.',
            suffix: AuthSuffixButton(
              onPressed: () {
                _emailAndPasscodeProvider.checkEmailDuplicate();
                FocusScope.of(context).unfocus();
              },
              text: '???????????? ??????',
            ),
          ),
        ),
        const SizedBox(height: 10),
        Visibility(
          visible: (widget.loginType == LoginType.email),
          child: AuthTextFormField(
            controller: _codeEditingController,
            validator: _emailAndPasscodeProvider.codeValidator,
            isValid: emailAndPasscodeProvider.isCodeValid,
            hintText: '????????????',
            suffix: AuthSuffixButton(
              onPressed: () {
                _emailAndPasscodeProvider
                    .checkPasscode(_codeEditingController.text);
                FocusScope.of(context).unfocus();
              },
              text: !emailAndPasscodeProvider.isCodeValid ? '???????????? ??????' : '?????? ??????',
              isActive: !emailAndPasscodeProvider.isCodeValid,
            ),
          ),
        ),
      ],
    );
  }
}
