import 'package:flutter/material.dart';
import 'package:looknote/app/utils/date_format_utils.dart';
import 'package:looknote/data/remote/network/model/notification/notification_model.dart';
import 'package:looknote/providers/notification/notification_provider.dart';
import 'package:looknote/screen/post/post_main/notification/components/notification_list_item.dart';
import 'package:provider/provider.dart';

class NotificationListView extends StatefulWidget {
  const NotificationListView({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationListView> createState() => _NotificationListViewState();
}

class _NotificationListViewState extends State<NotificationListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<NotificationProvider>().fetchInitialNotifications();

    _scrollController.addListener(() async {

      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          context.read<NotificationProvider>().page !=
              context.read<NotificationProvider>().lastPage) {
        context.read<NotificationProvider>().page += 1;



        Future.delayed(const Duration(milliseconds: 100)).then((value) async {
          await context.read<NotificationProvider>().fetchNotifications();

        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider =
        context.watch<NotificationProvider>();

    List<NotificationModel> notifications =
        notificationProvider.notificationModel;

    return ListView.builder(
        controller: _scrollController,
        itemCount: notificationProvider.loading
            ? notifications.length
            : notifications.length + 1,
        itemBuilder: (BuildContext context, int index) {
          NotificationModel notificationModel =
              notificationProvider.notificationModel[index];

          if (index < notifications.length) {
            return NotificationListItem(
              userName: notificationModel.from?.nickname ?? '',
              description:
                  notificationProvider.description(notificationModel.type),
              imageUrl: notificationModel.imageURL,
              date: DateFormatUtils.createdTime(
                DateTime.parse(notificationModel.createdAt),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
