import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/app/resource/strings.dart';
import 'package:looknote/providers/auth/login/login_provider.dart';
import 'package:looknote/screen/auth/components/auth_text_form_field.dart';
import 'package:provider/provider.dart';


class EmailLoginForm extends StatefulWidget {
  const EmailLoginForm({Key? key}) : super(key: key);

  @override
  State<EmailLoginForm> createState() => EmailLoginFormState();
}

class EmailLoginFormState extends State<EmailLoginForm> {
  late final LoginProvider _loginProvider;
  late final TextEditingController _emailEditingController;
  late final TextEditingController _passwordEditingController;

  @override
  void initState() {
    _loginProvider = context.read<LoginProvider>();

    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 88),
        AuthTextFormField(
          isValid: true,
          controller: _emailEditingController,
          hintText: loginTextFieldHint,
          onFieldSubmitted: (value) => _loginProvider.checkActive(
            _emailEditingController.text,
            _passwordEditingController.text,
          ),
        ),
        const SizedBox(height: 10),
        AuthTextFormField(
          isValid: true,
          obscureText: true,
          controller: _passwordEditingController,
          onFieldSubmitted: (value) => _loginProvider.checkActive(
            _emailEditingController.text,
            _passwordEditingController.text,
          ),
          hintText: passwordTextFieldHint,
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, LookNoteRouteNames.resetPassword),
          child: const Text(forgetPasswordTextButtonTitle, style: subTitle3),
        )
      ],
    );
  }
}
