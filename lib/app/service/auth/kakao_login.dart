import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:looknote/app/constants/shared_preference_key.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';


class KakaoLogin {
  KakaoLogin._();

  static Future<void> signInKakao() async {
    SharedPreferences sharedPreferences = serviceLocator<SharedPreferences>();

    if (await isKakaoTalkInstalled()) {
      try {
        var response = await UserApi.instance.loginWithKakaoTalk();
        await sharedPreferences.setString(
            SharedPreferenceKey.kakaoUserToken, response.accessToken);
      } catch (error) {
        logger().e('카카오톡으로 로그인 실패 $error');

        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        try {
          var response = await UserApi.instance.loginWithKakaoAccount();
          await sharedPreferences.setString(
              SharedPreferenceKey.kakaoUserToken, response.accessToken);
          logger().i('카카오계정으로 로그인 성공');

        } catch (error) {
          logger().e('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        var response = await UserApi.instance.loginWithKakaoAccount();
        await sharedPreferences.setString(
            SharedPreferenceKey.kakaoUserToken, response.accessToken);
        logger().i('카카오계정으로 로그인 성공');
      } catch (error) {
        logger().e('카카오계정으로 로그인 실패 $error');
      }
    }
  }
}
