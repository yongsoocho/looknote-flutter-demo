import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/model/auth/user_model.dart';
import 'package:looknote/data/remote/network/model/base/base_string_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';

import '../../../domain/repository/auth_api_repository.dart';
import '../../remote/clients/auth/auth_client.dart';
import '../../remote/network/dio/common/result.dart';
import '../../remote/network/model/auth/user_with_token_model.dart';
import '../../remote/network/model/base/base_model.dart';

class AuthApiRepositoryImpl implements AuthApiRepository {
  AuthClient api;

  AuthApiRepositoryImpl(this.api);

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> localLogin(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result = await api.localLogin(body);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<UserWithTokenModel>, ErrorModel>> kakaoLogin(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result = await api.kakaoLogin(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(
        ErrorModel(
            statusCode: result['statusCode'],
            timestamp: '${result['timestamp']}',
            success: false,
            error: false,
            data: '${result['data']}'),
      );
    }
  }

  @override
  Future<Result<BaseModel<UserWithTokenModel>, ErrorModel>> appleLogin(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result = await api.appleLogin(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> appleSignUp(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result = await api.appleSignUp(body);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> kakaoSignUp(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result = await api.kakaoSignUp(body);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> checkEmail(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.checkEmail(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> checkFindPasswordCode(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.checkFindPasswordCode(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> checkNickname(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.checkNickname(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> checkSignUpCode(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.checkSignUpCode(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<void, ErrorModel>> deleteUser(
      String token, Map<String, dynamic> body) async {
    try {
      final void result = await api.deleteAuth(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> localTokenLogin(
      String token) async {
    try {
      final BaseModel<UserWithTokenModel> result =
          await api.localTokenLogin(token);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> sendFindPasscode(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.sendFindPasswordCode(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> sendSignUpCode(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.sendSignUpCode(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> updateProfile(
      String token, Map<String, dynamic> body) async {
    try {
      final BaseModel<UserWithTokenModel> result =
          await api.updateProfile(token, body);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<UserWithTokenModel, ErrorModel>> localSignUp(
      UserSignUpModel signUpModel) async {
    try {
      final BaseModel<UserWithTokenModel> result =
          await api.localSignUp(signUpModel);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> resetPassword(
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.resetPassword(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<UserModel>, ErrorModel>> userSearch(
      Map<String, dynamic> body) async {
    try {
      final BaseModel<UserModel> result = await api.userSearch(body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseStringModel, ErrorModel>> setFCM(String token,
      Map<String, dynamic> body) async {
    try {
      final BaseStringModel result = await api.setFCM(token,body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }
}
