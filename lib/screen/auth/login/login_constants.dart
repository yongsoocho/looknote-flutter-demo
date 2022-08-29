import 'package:looknote/screen/auth/components/password_form.dart';

import 'widgets/login_widgets.dart';

enum ResetPasswordUpStep {
  usetAuth,
  resetPassword,
}

const resetPasswordTitles = [
  '본인 인증',
  '비밀번호 재설정',
];
const resetPasswordDescriptions = [
  '비밀번호 재설정을 위해 가입하신 회원정보를 입력해주세요.',
  '새로 사용하실 비민번호를 입력해주세요.',
];
const resetPasswordForms = [
  UserAuthForm(),
  PasswordForm(),
];
