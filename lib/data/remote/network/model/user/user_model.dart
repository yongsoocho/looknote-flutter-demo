import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/coin/coin_model.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
class UserModel with _$UserModel {
  factory UserModel({
    // update any properties as needed
    @Default('') String email,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @Default('') String name,
    @Default('') String nickname,
    @JsonKey(name: 'date_of_birth') @Default(0) int dateOfBirth,
    @Default('') String gender,
    @Default('') String provider,
    @Default('') String createAt,
    @Default(true) bool active,
    CoinModel? coin
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}