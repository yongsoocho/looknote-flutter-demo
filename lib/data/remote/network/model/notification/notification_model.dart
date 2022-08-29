import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel{
  factory NotificationModel({
    @JsonKey(name: 'push_id') @Default(0) int pushId,
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'from_id') @Default(0) int fromId,
    @Default('') String type,
    @Default('') String imageURL,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    UserModel?  from,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
}