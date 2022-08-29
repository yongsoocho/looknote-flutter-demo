import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/model/coin/coin_model.dart';
import 'package:looknote/data/remote/network/model/notification/notification_list_model.dart';
import 'package:looknote/data/remote/network/model/post/post_list_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../app/constants/url.dart';
import '../../network/model/base/base_model.dart';

part 'my_note_client.g.dart';

@RestApi()
abstract class MyNoteClient {
  factory MyNoteClient(Dio dio) = _MyNoteClient;

  @GET(RootNoteAPI.myNote)
  Future<BaseModel<PostListModel>> fetchMyPosts(
      @Header('Authorization') String token, @Query('page') int page,@Query('size') int size);

  @POST(RootNoteAPI.scrap)
  Future<BaseModel<PostListModel>> scrapPost(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);

  @GET(RootNoteAPI.scrap)
  Future<BaseModel<PostListModel>> fetchScrapPost(
      @Header('Authorization') String token, @Query('page') int page,@Query('size') int size);

  @GET(RootNoteAPI.myNoteCoin)
  Future<BaseModel<CoinModel>> fetchUserCoin(
      @Header('Authorization') String token);



  @GET(RootNoteAPI.notifications)
  Future<BaseModel<NotificationListModel>> fetchNotifications(
      @Header('Authorization') String token, @Query('page') int page,@Query('size') int size);

}
