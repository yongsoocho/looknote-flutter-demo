import 'package:looknote/data/remote/network/dio/common/result.dart';
import 'package:looknote/data/remote/network/model/base/base_model.dart';
import 'package:looknote/data/remote/network/model/coin/coin_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/data/remote/network/model/notification/notification_list_model.dart';
import 'package:looknote/data/remote/network/model/post/post_list_model.dart';

abstract class MyNoteApiRepository {
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchScrapPosts(
      String token, int page, int size);

  Future<Result<BaseModel<PostListModel>, ErrorModel>> scarpPost(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchMyPosts(
      String token, int page, int size);

  Future<Result<BaseModel<NotificationListModel>, ErrorModel>>
      fetchNotifications(String token, int page, int size);

  Future<Result<BaseModel<CoinModel>, ErrorModel>> fetchUserCoin(String token);
}
