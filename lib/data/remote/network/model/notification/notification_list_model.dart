import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looknote/data/remote/network/model/base/pagination/pagination_model.dart';
import 'package:looknote/data/remote/network/model/notification/notification_model.dart';
part 'notification_list_model.freezed.dart';
part 'notification_list_model.g.dart';

@freezed
class NotificationListModel with _$NotificationListModel {
  factory NotificationListModel(
      {List<NotificationModel>? pushs,
      PaginationModel? pagenation}) = _NotificationListModel;

  factory NotificationListModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationListModelFromJson(json);
}
