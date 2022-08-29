import 'dart:io';
import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/model/base/base_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_model.dart';
import 'package:looknote/data/remote/network/model/comment/comment_list_model.dart';
import 'package:looknote/data/remote/network/model/post/post_detail_model.dart';
import 'package:looknote/data/remote/network/model/post/post_list_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../app/constants/url.dart';
import '../../network/model/post/post_model.dart';

part 'post_client.g.dart';

@RestApi()
abstract class PostClient {
  factory PostClient(Dio dio, {String baseUrl}) = _PostClient;

  @GET(RootNoteAPI.getPosts)
  Future<BaseModel<PostListModel>> getPosts(
      @Header('Authorization') String token,
      @Query('page') int page,
      @Query('size') int size);

  @POST(RootNoteAPI.getPosts + '/userId')
  Future<BaseModel<PostListModel>> fetchPostsByUserId(
    @Header('Authorization') String token,
    @Body() Map<String, dynamic> body,
    @Query('page') int page,
    @Query('size') int size,
  );

  @GET(RootNoteAPI.getPostsPopular)
  Future<BaseModel<PostListModel>> fetchPostPopularity(
      @Header('Authorization') String token,
      @Query('page') int page,
      @Query('size') int size);

  @POST(RootNoteAPI.getPostDetail)
  Future<BaseModel<PostDetailModel>> getPostDetail(
      @Header('Authorization') String token, @Body() Map<String, dynamic> data);

  @POST(RootNoteAPI.upLoadPost)
  @MultiPart()
  Future<BaseModel<PostModel>> upLoadPost(
    @Header('Authorization') String token, {
    @Part() required File images,
  });

  @POST(RootNoteAPI.deletePost)
  Future<void> deletePost(@Header('Authorization') String token,
      @Body() Map<String, dynamic> body);

  @POST(RootNoteAPI.comment)
  Future<BaseModel<CommentModel>> createComment(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @PATCH(RootNoteAPI.comment)
  Future<BaseModel<CommentModel>> editComment(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @DELETE(RootNoteAPI.comment)
  Future<BaseModel<CommentModel>> deleteComment(
    @Header("Authorization") String token,
    @Body() Map<String, dynamic> body,
  );

  @GET(RootNoteAPI.comment)
  Future<BaseModel<CommentListModel>> getComments(
    @Header("Authorization") String token,
    @Query("post_id") String postId,
    @Query("page") int page,
    @Query("size") int size,
  );
}
