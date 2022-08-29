import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/data/repository/auth/auth_api_repository_impl.dart';
import 'package:looknote/domain/use_case/auth/kakao_sign_up_use_case.dart';
import 'package:looknote/providers/auth/sign_up/apple_sign_up_provider.dart';
import 'package:looknote/providers/auth/sign_up/kakao_sign_up_provider.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:looknote/providers/looknote_providers.dart';
import 'package:looknote/providers/user/user_search_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../../providers/auth/login/login_provider.dart';
import '../../../../providers/auth/login/reset_password_provider.dart';
import '../../../../providers/auth/login/user_auth_form_provider.dart';

List<SingleChildWidget> authProviders = [
  ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<UserSearchProvider>(
      create: (_) => UserSearchProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<UserAuthFormProvider>(
      create: (_) => UserAuthFormProvider(
            authApiRepository: serviceLocator<AuthApiRepositoryImpl>(),
          )),
  ChangeNotifierProvider<EditProfileProvider>(
      create: (_) => EditProfileProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<DeleteUserProvider>(
      create: (_) => DeleteUserProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<TermsOfUseProvider>(
      create: (_) => TermsOfUseProvider()),
  ChangeNotifierProvider<EmailAndPasscodeProvider>(
      create: (_) => EmailAndPasscodeProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<PasswordProvider>(create: (_) => PasswordProvider()),
  ChangeNotifierProvider<UsernameProvider>(
      create: (_) => UsernameProvider(
          authApiRepository: serviceLocator<AuthApiRepositoryImpl>())),
  ChangeNotifierProvider<GenderAgeProvider>(create: (_) => GenderAgeProvider()),
  ChangeNotifierProxyProvider4<EmailAndPasscodeProvider, PasswordProvider,
      UsernameProvider, GenderAgeProvider, SignUpProvider>(
    create: (_) => SignUpProvider(
        authApiRepository: serviceLocator<AuthApiRepositoryImpl>()),
    update: (
      _,
      emailAndPasscodeProvider,
      passwordProvider,
      usernameProvider,
      genderAgeProvider,
      signUpProvider,
    ) =>
        signUpProvider!
          ..update(
            emailAndPasscodeProvider,
            passwordProvider,
            usernameProvider,
            genderAgeProvider,
          ),
  ),
  ChangeNotifierProxyProvider3<EmailAndPasscodeProvider, UsernameProvider,
      GenderAgeProvider, AppleSignUpProvider>(
    create: (_) => AppleSignUpProvider(
        authApiRepository: serviceLocator<AuthApiRepositoryImpl>()),
    update: (
      _,
      emailAndPasscodeProvider,
      usernameProvider,
      genderAgeProvider,
      appleSignUpProvider,
    ) =>
        appleSignUpProvider!
          ..update(
            emailAndPasscodeProvider,
            usernameProvider,
            genderAgeProvider,
          ),
  ),
  ChangeNotifierProxyProvider2<UsernameProvider, GenderAgeProvider,
      KakaoSignUpProvider>(
    create: (_) => KakaoSignUpProvider(
        useCase: serviceLocator<KakaoSignUpUseCase>(),
        authApiRepository: serviceLocator<AuthApiRepositoryImpl>()),
    update: (
      _,
      usernameProvider,
      genderAgeProvider,
      kakaoSignUpProvider,
    ) =>
        kakaoSignUpProvider!
          ..update(
            usernameProvider,
            genderAgeProvider,
          ),
  ),
  ChangeNotifierProxyProvider2<UserAuthFormProvider, PasswordProvider,
      ResetPasswordProvider>(
    create: (_) => ResetPasswordProvider(
      authApiRepository: serviceLocator<AuthApiRepositoryImpl>(),
    ),
    update: (
      _,
      userAuthFormProvider,
      passwordProvider,
      resetPasswordProvider,
    ) =>
        resetPasswordProvider!
          ..update(
            userAuthFormProvider,
            passwordProvider,
          ),
  ),
];
