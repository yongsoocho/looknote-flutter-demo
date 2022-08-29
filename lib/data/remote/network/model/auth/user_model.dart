import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
class UserSignUpModel with _$UserSignUpModel {
  factory UserSignUpModel({
    required String email,
    required String password,
    required String name,
    required String nickname,
    @JsonKey(name: 'date_of_birth') @Default(0) int dateOfBirth,
    @Default('ETC') String gender,
    @Default('') String height,
    @Default('') String weight,
  }) = _UserSignUpModel;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => _$UserSignUpModelFromJson(json);
}

@freezed
class AppleUserSignUpModel with _$AppleUserSignUpModel {
  const factory AppleUserSignUpModel({
    required String code,
    required String name,
    required String nickname,
    required String dateOfBirth,
    required String gender,
    required String height,
    required String weight,
    required bool agree,
  }) = _AppleUserSignUpModel;

  factory AppleUserSignUpModel.fromJson(Map<String, dynamic> json) => _$AppleUserSignUpModelFromJson(json);
}
