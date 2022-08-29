import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T,R> with _$Result<T,R> {
  const factory Result.success(T data) = Success;
  const factory Result.error(R data) = Error;
}