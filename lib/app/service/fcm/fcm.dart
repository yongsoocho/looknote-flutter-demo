
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:looknote/app/constants/shared_preference_key.dart';
// import 'package:looknote/app/di/service_locator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//
// class AppFCM {
//   AppFCM._();
//
//   static Future<void> _firebaseMessagingBackgroundHandler(
//       RemoteMessage message) async {
//     print('Handling a background message ${message.messageId}');
//   }
//
//   static Future<void> firebaseMessagingSetting() async {
//
//     var initialzationSettingsIOS = IOSInitializationSettings(
//       requestSoundPermission: true,
//       requestBadgePermission: true,
//       requestAlertPermission: true,
//     );
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     var initializationSettings =
//         InitializationSettings(iOS: initialzationSettingsIOS);
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//
//   static Future<void> setToken() async {
//     final token = await FirebaseMessaging.instance.getToken();
//     final prefs = serviceLocator<SharedPreferences>();
//     prefs.setString(SharedPreferenceKey.fCMToken, token ?? '');
//   }
//
// }
