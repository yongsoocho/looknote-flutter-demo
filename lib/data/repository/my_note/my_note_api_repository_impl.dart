import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:looknote/data/remote/clients/my_note/my_note_client.dart';
import 'package:looknote/data/remote/network/dio/common/result.dart';
import 'package:looknote/data/remote/network/model/base/base_model.dart';
import 'package:looknote/data/remote/network/model/coin/coin_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/data/remote/network/model/notification/notification_list_model.dart';
import 'package:looknote/data/remote/network/model/post/post_list_model.dart';
import 'package:looknote/domain/repository/my_note_api_repository.dart';

class MyNoteApiRepositoryImpl implements MyNoteApiRepository {
  MyNoteClient api;

  MyNoteApiRepositoryImpl(this.api);

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchMyPosts(
      String token, int page, int size) async {
    try {
      final BaseModel<PostListModel> result =
      await api.fetchMyPosts(token, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchScrapPosts(
      String token, int page, int size) async {
    try {
      final BaseModel<PostListModel> result =
      await api.fetchScrapPost(token, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> scarpPost(String token,
      Map<String, dynamic> body) async {
    try {
      final BaseModel<PostListModel> result = await api.scrapPost(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<NotificationListModel>, ErrorModel>>
  fetchNotifications(String token, int page, int size) async {
    try {
      final BaseModel<NotificationListModel> result =
      await api.fetchNotifications(token, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<CoinModel>, ErrorModel>> fetchUserCoin(
      String token) async {
    try {
      final BaseModel<CoinModel> result = await api.fetchUserCoin(token);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }
}
