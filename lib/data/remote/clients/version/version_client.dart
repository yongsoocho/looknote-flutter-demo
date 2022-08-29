import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/model/base/base_bool_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../app/constants/url.dart';
part 'version_client.g.dart';

@RestApi()
abstract class VersionClient {
  factory VersionClient(Dio dio, {String baseUrl}) = _VersionClient;

  @POST(RootNoteAPI.version)
  Future<BaseBoolModel> checkVersion(@Body() Map<String, dynamic> body);

}