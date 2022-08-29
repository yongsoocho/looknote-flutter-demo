import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/data/repository/post/post_api_repository_impl.dart';
import 'package:looknote/providers/posts/comment_provider.dart';
import 'package:looknote/providers/posts/post_provider.dart';
import 'package:looknote/providers/posts/post_search_provider.dart';
import 'package:looknote/providers/posts/post_upload_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> postProviders = [
  ChangeNotifierProvider<CommentProvider>(
    create: (_) => CommentProvider(
      postApiRepository: serviceLocator<PostApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<PostProvider>(
    create: (context) => PostProvider(
      postApiRepository: serviceLocator<PostApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<PostSearchProvider>(
    create: (context) => PostSearchProvider(
      postApiRepository: serviceLocator<PostApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<PostUploadProvider>(
    create: (_) => PostUploadProvider(
      postApiRepository: serviceLocator<PostApiRepositoryImpl>(),
      prefs: serviceLocator<SharedPreferences>(),
    ),
  ),
];
