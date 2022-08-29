import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:looknote/app/config/size/size_config.dart';
import 'package:looknote/app/service/version/version_check.dart';
import 'package:looknote/data/repository/auth/auth_api_repository_impl.dart';
import 'package:looknote/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'app/config/providers/providers.dart';
import 'app/config/routes/routes.dart';
import 'app/config/themes/theme_config.dart';
import 'app/di/service_locator.dart';
import 'app/service/device_info/device_info_manager.dart';
import 'app/service/package_info/pagkage_info_manager.dart';
import 'firebase_options.dart';

final GlobalKey<ScaffoldMessengerState> snackBarKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

SnackBar errorSnackBar(String message) {
  return SnackBar(content: Text(message));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '2e07baee3e1de4175adda05731c6d63f');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initServiceLocator();

  DeviceInfoManager.getDeviceInfo();
  PackageInfoManager.getVersionInfo();

  //fcm setting
  //AppFCM.firebaseMessagingSetting();

  //device 정보 및 package info 가져오기
  final state =
      AuthProvider(authApiRepository: serviceLocator<AuthApiRepositoryImpl>());
  state.checkLoggedIn();

  runApp(LookNote(
    authProvider: state,
  ));
}

class LookNote extends StatefulWidget {
  static const String _title = 'LookNote';

  const LookNote({Key? key, required this.authProvider}) : super(key: key);

  final AuthProvider authProvider;

  @override
  State<LookNote> createState() => _LookNoteState();
}

class _LookNoteState extends State<LookNote> {
  bool isForcedUpdate = false;

  @override
  void initState() {
    VersionCheck.isForcedUpdate().then((value) async {
      isForcedUpdate = value;
    });

    super.initState();
  }

  String get setInitialRoutes {
    if (isForcedUpdate) {
      return LookNoteRouteNames.update;
    }
    if (!widget.authProvider.entryIn) {
      return LookNoteRouteNames.workThrough;
    } else {
      return widget.authProvider.loggedIn
          ? LookNoteRouteNames.home
          : LookNoteRouteNames.login;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: LookNote._title,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: snackBarKey,
        localizationsDelegates: const [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko', ''),
          Locale('en', ''),
        ],
        theme: ThemeConfig.lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: setInitialRoutes,
        routes: routes,
        navigatorObservers: [serviceLocator<FirebaseAnalyticsObserver>()],
      ),
    );
  }
}
