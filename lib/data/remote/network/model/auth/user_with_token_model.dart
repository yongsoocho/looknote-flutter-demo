import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user_model.dart';

part 'user_with_token_model.freezed.dart';
part 'user_with_token_model.g.dart';

@freezed
class UserWithTokenModel with _$UserWithTokenModel {
  const factory UserWithTokenModel({
    required UserModel user,
    @JsonKey(name: 'access_token') @Default('') String accessToken,
  }) = _UserWithTokenModel;

  factory UserWithTokenModel.fromJson(Map<String, dynamic> json) => _$UserWithTokenModelFromJson(json);
}

@freezed
class NewUserWithTokenModel with _$NewUserWithTokenModel {
  const factory NewUserWithTokenModel({
    required UserModel? user,
    required UserModel? newUser,
    @JsonKey(name: 'access_token') @Default('') String accessToken,
  }) = _NewUserWithTokenModel;

  factory NewUserWithTokenModel.fromJson(Map<String, dynamic> json) => _$NewUserWithTokenModelFromJson(json);
}
