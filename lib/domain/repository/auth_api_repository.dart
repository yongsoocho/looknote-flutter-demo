import 'package:looknote/data/remote/network/dio/common/result.dart';
import 'package:looknote/data/remote/network/model/auth/user_model.dart';
import 'package:looknote/data/remote/network/model/auth/user_with_token_model.dart';
import 'package:looknote/data/remote/network/model/base/base_model.dart';
import 'package:looknote/data/remote/network/model/base/base_string_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';

abstract class AuthApiRepository {
  Future<Result<UserWithTokenModel,ErrorModel>> localLogin(Map<String,dynamic> body);
  Future<Result<UserWithTokenModel,ErrorModel>> localSignUp(UserSignUpModel signUpModel);
  Future<Result<UserWithTokenModel,ErrorModel>> localTokenLogin(String token);
  Future<Result<BaseModel<UserWithTokenModel>,ErrorModel>> kakaoLogin(Map<String,dynamic> body);
  Future<Result<UserWithTokenModel,ErrorModel>> kakaoSignUp(Map<String,dynamic> body);
  Future<Result<BaseModel<UserWithTokenModel>,ErrorModel>> appleLogin(Map<String,dynamic> body);
  Future<Result<UserWithTokenModel,ErrorModel>> appleSignUp(Map<String,dynamic> body);

  Future<Result<BaseStringModel,ErrorModel>> checkEmail(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> checkNickname(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> sendSignUpCode(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> checkSignUpCode(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> sendFindPasscode(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> checkFindPasswordCode(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> resetPassword(Map<String,dynamic> body);
  Future<Result<void,ErrorModel>> deleteUser(String token,Map<String,dynamic> body);

  Future<Result<UserWithTokenModel,ErrorModel>> updateProfile(String token,Map<String,dynamic> body);
  Future<Result<BaseModel<UserModel>,ErrorModel>> userSearch(Map<String,dynamic> body);
  Future<Result<BaseStringModel,ErrorModel>> setFCM(String token,Map<String,dynamic> body);
}