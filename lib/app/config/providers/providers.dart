import 'package:looknote/app/config/providers/auth/auth_provider.dart';
import 'package:looknote/app/config/providers/post/post_provider.dart';
import 'package:looknote/data/repository/my_note/my_note_api_repository_impl.dart';
import 'package:looknote/data/repository/post/post_api_repository_impl.dart';
import 'package:looknote/providers/notification/notification_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../providers/looknote_providers.dart';
import '../../../providers/my_note/my_note_provider.dart';
import '../../../providers/scarp/scrap_provider.dart';
import '../../../screen/bottom_navigation/bottom_navigation_view_model.dart';
import '../../di/service_locator.dart';

List<SingleChildWidget> providers = [
  ...authProviders,
  ...postProviders,
  ChangeNotifierProvider<MyNoteProvider>(
    create: (_) => MyNoteProvider(
      myNoteApiRepository: serviceLocator<MyNoteApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<NotificationProvider>(
    create: (_) => NotificationProvider(
      serviceLocator<MyNoteApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<ScrapProvider>(
    create: (_) => ScrapProvider(
      myNoteApiRepository: serviceLocator<MyNoteApiRepositoryImpl>(),
    ),
  ),
  ChangeNotifierProvider<BottomNavigationViewModel>(
    create: (_) => BottomNavigationViewModel(),
  ),

  ChangeNotifierProvider<PostDetailProvider>(
    create: (_) => PostDetailProvider(
      myNoteApiRepository: serviceLocator<MyNoteApiRepositoryImpl>(),
      postApiRepository: serviceLocator<PostApiRepositoryImpl>(),
    ),
  ),
];
