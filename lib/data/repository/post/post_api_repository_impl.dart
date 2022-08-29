import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../domain/repository/post_api_repository.dart';
import '../../remote/clients/post/post_client.dart';
import '../../remote/network/dio/common/result.dart';
import '../../remote/network/model/base/base_model.dart';
import '../../remote/network/model/comment/comment_list_model.dart';
import '../../remote/network/model/comment/comment_model.dart';
import '../../remote/network/model/error/error_model.dart';
import '../../remote/network/model/post/post_detail_model.dart';
import '../../remote/network/model/post/post_list_model.dart';
import '../../remote/network/model/post/post_model.dart';

class PostApiRepositoryImpl implements PostApiRepository {
  PostClient api;

  PostApiRepositoryImpl(this.api);

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPostsByUserId(
      String token, Map<String,dynamic> body, int page, int size) async {
    try {
      final BaseModel<PostListModel> result = await api.fetchPostsByUserId(
        token,
        body,
        page,
        size,
      );
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPosts(
      String token, int page, int size) async {
    try {
      final BaseModel<PostListModel> result =
          await api.getPosts(token, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<PostDetailModel>, ErrorModel>> fetchPostDetail(
      String token, Map<String, dynamic> body) async {
    try {
      final BaseModel<PostDetailModel> result =
          await api.getPostDetail(token, body);


      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPostPopularity(
      String token, int page, int size) async {
    try {
      final BaseModel<PostListModel> result =
          await api.fetchPostPopularity(token, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<CommentModel>, ErrorModel>> createComment(
      String token, Map<String, dynamic> body) async {
    try {
      final BaseModel<CommentModel> result =
          await api.createComment(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<CommentModel>, ErrorModel>> deleteComment(
      String token, Map<String, dynamic> body) async {
    try {
      final BaseModel<CommentModel> result =
          await api.deleteComment(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<void, ErrorModel>> deletePost(
      String token, Map<String, dynamic> body) async {
    try {
      final result = await api.deletePost(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<CommentModel>, ErrorModel>> editComment(
      String token, Map<String, dynamic> body) async {
    try {
      final BaseModel<CommentModel> result = await api.editComment(token, body);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<BaseModel<CommentListModel>, ErrorModel>> fetchComments(
      String token, String postId, int page, int size) async {
    try {
      final BaseModel<CommentListModel> result =
          await api.getComments(token, postId, page, size);
      return Result.success(result);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }

  @override
  Future<Result<PostModel, ErrorModel>> uploadPost(String token,
      {required File images}) async {
    try {
      final BaseModel<PostModel> result =
          await api.upLoadPost(token, images: images);
      return Result.success(result.data);
    } on DioError catch (e) {
      var result = await jsonDecode(e.response.toString());
      return Result.error(ErrorModel.fromJson(result));
    }
  }
}
