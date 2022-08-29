// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinModel _$$_CoinModelFromJson(Map<String, dynamic> json) => _$_CoinModel(
      coinId: json['coin_id'] as int? ?? 0,
      coinSum: json['coin_sum'] as int? ?? 0,
      updateAt: json['updated_at'] as String? ?? '',
      coin: json['coin'] as int? ?? 0,
    );

Map<String, dynamic> _$$_CoinModelToJson(_$_CoinModel instance) =>
    <String, dynamic>{
      'coin_id': instance.coinId,
      'coin_sum': instance.coinSum,
      'updated_at': instance.updateAt,
      'coin': instance.coin,
    };
