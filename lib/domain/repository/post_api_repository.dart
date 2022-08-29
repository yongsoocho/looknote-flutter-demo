import 'dart:io';

import 'package:looknote/data/remote/network/dio/common/result.dart';
import 'package:looknote/data/remote/network/model/base/base_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_list_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_model.dart';
import 'package:looknote/data/remote/network/model/error/error_model.dart';
import 'package:looknote/data/remote/network/model/post/post_detail_model.dart';
import 'package:looknote/data/remote/network/model/post/post_list_model.dart';
import 'package:looknote/data/remote/network/model/post/post_model.dart';

abstract class PostApiRepository {
  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPosts(
      String token, int page, int size);

  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPostsByUserId(
      String token, Map<String,dynamic> body, int page, int size);

  Future<Result<BaseModel<PostDetailModel>, ErrorModel>> fetchPostDetail(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<PostListModel>, ErrorModel>> fetchPostPopularity(
      String token, int page, int size);

  Future<Result<PostModel, ErrorModel>> uploadPost(
    String token, {
    required File images,
  });

  Future<Result<void, ErrorModel>> deletePost(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<CommentModel>, ErrorModel>> createComment(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<CommentModel>, ErrorModel>> editComment(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<CommentModel>, ErrorModel>> deleteComment(
      String token, Map<String, dynamic> body);

  Future<Result<BaseModel<CommentListModel>, ErrorModel>> fetchComments(
      String token, String postId, int page, int size);
}
