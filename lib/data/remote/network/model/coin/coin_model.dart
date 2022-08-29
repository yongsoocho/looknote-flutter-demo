import 'package:freezed_annotation/freezed_annotation.dart';
part 'coin_model.g.dart';
part 'coin_model.freezed.dart';

@freezed
class CoinModel with _$CoinModel {
  factory CoinModel({
    @JsonKey(name: 'coin_id') @Default(0) int coinId,
    @JsonKey(name: 'coin_sum') @Default(0) int coinSum,
    @JsonKey(name: 'updated_at') @Default('') String updateAt,
    @Default(0) int coin,

  }) = _CoinModel;


  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}
