import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:looknote/data/remote/network/dio/interceptor/error_interceptor.dart';


abstract class AppDio {
  static const String testUrl = 'https://api.looknote.co.kr';
  static const String baseUrl = 'https://domain.looknote.co.kr';

  AppDio._internal();

  static Dio? _instance;

  static Dio getInstance() => _instance ??= _AppDio();
}

class _AppDio with DioMixin implements Dio {
  _AppDio() {
    httpClientAdapter = DefaultHttpClientAdapter();
    options = BaseOptions(
      baseUrl: AppDio.testUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
      // http 상태 코드가 200대(성공)이 아니더라도 응답 데이터를 수신하는지 여부.
      receiveDataWhenStatusError: true,
      headers: <String, dynamic>{
        'accept': 'application/json',
        'Content-Type' : 'application/json'
      },
    );

    interceptors.addAll([

      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onError: (DioError err, ErrorInterceptorHandler handler) {
          lock();
          ErrorInterceptor.onError(err, handler);
          unlock();

        },
      ),
    ]);
  }
}
