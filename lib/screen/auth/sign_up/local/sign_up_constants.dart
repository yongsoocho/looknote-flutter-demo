import 'package:looknote/screen/auth/components/password_form.dart';

import '../widgets/sign_up_widgets.dart';

enum SignUpStep {
  nameAndEmail,
  password,
  username,
  genderAndAge,
}

const signUpTitles = [
  '본인 인증 및 아이디 설정',
  '비밀번호 설정',
  '닉네임 설정',
  '성별 및 생년월일 설정',
];
const signUpDescriptions = [
  '본인 인증이 가능한 이메일로 아이디를 설정해주세요.',
  '안전한 비밀번호로 설정해주세요.',
  '커뮤니티 활동에서 사용될 닉네임을 설정해 주세요.',
  '보다 정확한 콘텐츠 추천을 위해 활용될 예정입니다.',
];
const signUpForms = [
  NameAndEmailForm(),
  PasswordForm(),
  UsernameForm(),
  GenderAndAgeForm(),
];

const genderStatus = {
  'ETC': '기타',
  'FEMALE': '여성',
  'MALE': '남성',
};
