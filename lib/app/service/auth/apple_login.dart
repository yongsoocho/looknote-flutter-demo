import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLogin {
  AppleLogin._();



  static Future<void> signInApple() async {
    SharedPreferences sharedPreferences = serviceLocator<SharedPreferences>();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    await sharedPreferences.setString(
        SharedPreferenceKey.appleUserToken, credential.identityToken!);

    await sharedPreferences.setString(
        SharedPreferenceKey.appleEmail, credential.email ?? '');



  }


}