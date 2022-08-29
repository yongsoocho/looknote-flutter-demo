
import 'package:flutter/foundation.dart';
import 'package:looknote/app/service/auth/auth_token_helper.dart';
import 'package:looknote/data/remote/network/model/notification/notification_model.dart';
import 'package:looknote/domain/repository/my_note_api_repository.dart';

class NotificationProvider extends ChangeNotifier {
  final MyNoteApiRepository myNoteApiRepository;

  NotificationProvider(this.myNoteApiRepository);

  List<NotificationModel> notificationModel = [];

  bool _loading = false;

  bool get loading => _loading;

  int page = 1;
  int lastPage = 0;
  int size = 10;

  Future<void> fetchInitialNotifications() async {
    page = 1;
    notificationModel = [];
    final result =
    await myNoteApiRepository.fetchNotifications('Bearer ${AuthTokenHelper.getToken()}', page, size);
    _loading = false;
    result.when(
        success: (success) {
          _loading = true;
          notificationModel = success.data.pushs!;
          lastPage = success.data.pagenation?.lastPage ?? 0;
          notifyListeners();
        },
        error: (error) {});
  }


  Future<void> fetchNotifications() async {
    final result =
    await myNoteApiRepository.fetchNotifications('Bearer ${AuthTokenHelper.getToken()}', page, size);
    _loading = false;
    result.when(
        success: (success) {
          _loading = true;
          notificationModel = notificationModel +  success.data.pushs!;
          lastPage = success.data.pagenation?.lastPage ?? 0;
          notifyListeners();
        },
        error: (error) {});
  }


  String description(String type) {
    if (type == 'scrap') {
        return '보드를 스크랩했습니다.';
    } else if (type == 'comment') {
      return '보드에 댓글을 남겼습니다.';
    } else {
      return '확인';
    }

  }

  bool get isLastPage {
    return page == lastPage || lastPage == 0;
  }


}