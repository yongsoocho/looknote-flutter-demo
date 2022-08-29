import 'package:looknote/data/remote/network/dio/common/result.dart';
import 'package:looknote/data/remote/network/model/auth/user_with_token_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/domain/repository/auth_api_repository.dart';

import '../../../main.dart';

class KakaoSignUpUseCase {
  final AuthApiRepository repository;

  KakaoSignUpUseCase({required this.repository});

  Future<Result<UserWithTokenModel, ErrorModel>> call(
      Map<String, dynamic> body) async {

    final response = await repository.kakaoSignUp(body);
    response.when(
        success: (success) {},
        error: (error) {
          snackBarKey.currentState?.showSnackBar(
            errorSnackBar(error.data),
          );
        });

    return response;
  }
}
