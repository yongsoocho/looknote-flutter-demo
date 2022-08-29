import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:looknote/data/remote/clients/auth/auth_client.dart';
import 'package:looknote/data/remote/clients/my_note/my_note_client.dart';
import 'package:looknote/data/remote/clients/post/post_client.dart';
import 'package:looknote/data/remote/clients/version/version_client.dart';
import 'package:looknote/data/remote/network/dio/dio.dart';
import 'package:looknote/data/repository/auth/auth_api_repository_impl.dart';
import 'package:looknote/data/repository/my_note/my_note_api_repository_impl.dart';
import 'package:looknote/data/repository/post/post_api_repository_impl.dart';
import 'package:looknote/domain/use_case/auth/kakao_sign_up_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  final analytics = FirebaseAnalytics.instance;
  serviceLocator.registerSingleton<FirebaseAnalytics>(analytics);
  serviceLocator.registerSingleton<FirebaseAnalyticsObserver>(
    FirebaseAnalyticsObserver(analytics: analytics),
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => AppDio.getInstance());
  serviceLocator.registerLazySingleton(() => AuthClient(serviceLocator<Dio>()));
  serviceLocator
      .registerLazySingleton(() => VersionClient(serviceLocator<Dio>()));
  // serviceLocator.registerLazySingleton(() => AuthProvider());
  serviceLocator
      .registerLazySingleton(() => MyNoteClient(serviceLocator<Dio>()));
  serviceLocator.registerLazySingleton(() => PostClient(serviceLocator<Dio>()));
  serviceLocator.registerLazySingleton(
      () => PostApiRepositoryImpl(serviceLocator<PostClient>()));
  serviceLocator.registerLazySingleton(
      () => AuthApiRepositoryImpl(serviceLocator<AuthClient>()));
  serviceLocator.registerLazySingleton(
      () => MyNoteApiRepositoryImpl(serviceLocator<MyNoteClient>()));

  serviceLocator.registerLazySingleton(() =>
      KakaoSignUpUseCase(repository: serviceLocator<AuthApiRepositoryImpl>()));
}
