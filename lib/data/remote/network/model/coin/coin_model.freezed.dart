// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) {
  return _CoinModel.fromJson(json);
}

/// @nodoc
class _$CoinModelTearOff {
  const _$CoinModelTearOff();

  _CoinModel call(
      {@JsonKey(name: 'coin_id') int coinId = 0,
      @JsonKey(name: 'coin_sum') int coinSum = 0,
      @JsonKey(name: 'updated_at') String updateAt = '',
      int coin = 0}) {
    return _CoinModel(
      coinId: coinId,
      coinSum: coinSum,
      updateAt: updateAt,
      coin: coin,
    );
  }

  CoinModel fromJson(Map<String, Object?> json) {
    return CoinModel.fromJson(json);
  }
}

/// @nodoc
const $CoinModel = _$CoinModelTearOff();

/// @nodoc
mixin _$CoinModel {
  @JsonKey(name: 'coin_id')
  int get coinId => throw _privateConstructorUsedError;
  @JsonKey(name: 'coin_sum')
  int get coinSum => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updateAt => throw _privateConstructorUsedError;
  int get coin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinModelCopyWith<CoinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinModelCopyWith<$Res> {
  factory $CoinModelCopyWith(CoinModel value, $Res Function(CoinModel) then) =
      _$CoinModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'coin_id') int coinId,
      @JsonKey(name: 'coin_sum') int coinSum,
      @JsonKey(name: 'updated_at') String updateAt,
      int coin});
}

/// @nodoc
class _$CoinModelCopyWithImpl<$Res> implements $CoinModelCopyWith<$Res> {
  _$CoinModelCopyWithImpl(this._value, this._then);

  final CoinModel _value;
  // ignore: unused_field
  final $Res Function(CoinModel) _then;

  @override
  $Res call({
    Object? coinId = freezed,
    Object? coinSum = freezed,
    Object? updateAt = freezed,
    Object? coin = freezed,
  }) {
    return _then(_value.copyWith(
      coinId: coinId == freezed
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as int,
      coinSum: coinSum == freezed
          ? _value.coinSum
          : coinSum // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      coin: coin == freezed
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CoinModelCopyWith<$Res> implements $CoinModelCopyWith<$Res> {
  factory _$CoinModelCopyWith(
          _CoinModel value, $Res Function(_CoinModel) then) =
      __$CoinModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'coin_id') int coinId,
      @JsonKey(name: 'coin_sum') int coinSum,
      @JsonKey(name: 'updated_at') String updateAt,
      int coin});
}

/// @nodoc
class __$CoinModelCopyWithImpl<$Res> extends _$CoinModelCopyWithImpl<$Res>
    implements _$CoinModelCopyWith<$Res> {
  __$CoinModelCopyWithImpl(_CoinModel _value, $Res Function(_CoinModel) _then)
      : super(_value, (v) => _then(v as _CoinModel));

  @override
  _CoinModel get _value => super._value as _CoinModel;

  @override
  $Res call({
    Object? coinId = freezed,
    Object? coinSum = freezed,
    Object? updateAt = freezed,
    Object? coin = freezed,
  }) {
    return _then(_CoinModel(
      coinId: coinId == freezed
          ? _value.coinId
          : coinId // ignore: cast_nullable_to_non_nullable
              as int,
      coinSum: coinSum == freezed
          ? _value.coinSum
          : coinSum // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: updateAt == freezed
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as String,
      coin: coin == freezed
          ? _value.coin
          : coin // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoinModel implements _CoinModel {
  _$_CoinModel(
      {@JsonKey(name: 'coin_id') this.coinId = 0,
      @JsonKey(name: 'coin_sum') this.coinSum = 0,
      @JsonKey(name: 'updated_at') this.updateAt = '',
      this.coin = 0});

  factory _$_CoinModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoinModelFromJson(json);

  @override
  @JsonKey(name: 'coin_id')
  final int coinId;
  @override
  @JsonKey(name: 'coin_sum')
  final int coinSum;
  @override
  @JsonKey(name: 'updated_at')
  final String updateAt;
  @JsonKey()
  @override
  final int coin;

  @override
  String toString() {
    return 'CoinModel(coinId: $coinId, coinSum: $coinSum, updateAt: $updateAt, coin: $coin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CoinModel &&
            const DeepCollectionEquality().equals(other.coinId, coinId) &&
            const DeepCollectionEquality().equals(other.coinSum, coinSum) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt) &&
            const DeepCollectionEquality().equals(other.coin, coin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(coinId),
      const DeepCollectionEquality().hash(coinSum),
      const DeepCollectionEquality().hash(updateAt),
      const DeepCollectionEquality().hash(coin));

  @JsonKey(ignore: true)
  @override
  _$CoinModelCopyWith<_CoinModel> get copyWith =>
      __$CoinModelCopyWithImpl<_CoinModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoinModelToJson(this);
  }
}

abstract class _CoinModel implements CoinModel {
  factory _CoinModel(
      {@JsonKey(name: 'coin_id') int coinId,
      @JsonKey(name: 'coin_sum') int coinSum,
      @JsonKey(name: 'updated_at') String updateAt,
      int coin}) = _$_CoinModel;

  factory _CoinModel.fromJson(Map<String, dynamic> json) =
      _$_CoinModel.fromJson;

  @override
  @JsonKey(name: 'coin_id')
  int get coinId;
  @override
  @JsonKey(name: 'coin_sum')
  int get coinSum;
  @override
  @JsonKey(name: 'updated_at')
  String get updateAt;
  @override
  int get coin;
  @override
  @JsonKey(ignore: true)
  _$CoinModelCopyWith<_CoinModel> get copyWith =>
      throw _privateConstructorUsedError;
}
