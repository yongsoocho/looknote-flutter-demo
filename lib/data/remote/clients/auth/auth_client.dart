import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/model/auth/user_model.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../app/constants/url.dart';
import '../../network/model/auth/user_with_token_model.dart';
import '../../network/model/base/base_model.dart';
import '../../network/model/base/base_string_model.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio) = _AuthClient;

  @POST(RootNoteAPI.localLogin)
  Future<BaseModel<UserWithTokenModel>> localLogin(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.localSignUp)
  Future<BaseModel<UserWithTokenModel>> localSignUp(
      @Body() UserSignUpModel userSignUpModel);

  @GET(RootNoteAPI.localTokenLogin)
  Future<BaseModel<UserWithTokenModel>> localTokenLogin(
      @Header("Authorization") String token);

  @POST(RootNoteAPI.kakaoLogin)
  Future<BaseModel<UserWithTokenModel>> kakaoLogin(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.kakaoSignUp)
  Future<BaseModel<UserWithTokenModel>> kakaoSignUp(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.appleLogin)
  Future<BaseModel<UserWithTokenModel>> appleLogin(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.appleSignUp)
  Future<BaseModel<UserWithTokenModel>> appleSignUp(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.checkEmailUrl)
  Future<BaseStringModel> checkEmail(@Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.checkNicknameUrl)
  Future<BaseStringModel> checkNickname(@Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.sendSignUpCode)
  Future<BaseStringModel> sendSignUpCode(@Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.checkSignUpCode)
  Future<BaseStringModel> checkSignUpCode(@Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.sendFindPasswordCode)
  Future<BaseStringModel> sendFindPasswordCode(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.checkFindPasswordCode)
  Future<BaseStringModel> checkFindPasswordCode(
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.resetPassword)
  Future<BaseStringModel> resetPassword(@Body() Map<String, dynamic> body);

  @DELETE(RootNoteAPI.user)
  Future<void> deleteAuth(
      @Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @PATCH(RootNoteAPI.user)
  Future<BaseModel<UserWithTokenModel>> updateProfile(
      @Header("Authorization") String token, @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.userSearch)
  Future<BaseModel<UserModel>> userSearch(@Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.setFCM)
  Future<BaseStringModel> setFCM(@Header("Authorization") String token, @Body() Map<String, dynamic> body);
}
