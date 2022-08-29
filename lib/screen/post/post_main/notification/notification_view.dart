import 'package:flutter/material.dart';
import 'package:looknote/screen/post/post_main/notification/components/notification_list_view.dart';
import 'notification_app_bar.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  static const String routeName = '/notificationview';

  @override
  Widget build(BuildContext context) {


    return const Scaffold(
      backgroundColor: Colors.white,
      appBar:  NotificationAppBar(),
      body: NotificationListView(),
    );
  }
}
