import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:looknote/data/remote/network/model/coin/coin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants/shared_preference_key.dart';
import '../../app/di/service_locator.dart';
import '../../app/utils/auth_token_helper.dart';
import '../../data/remote/network/model/post/post_model.dart';
import '../../domain/repository/my_note_api_repository.dart';

class MyNoteProvider with ChangeNotifier {
  final MyNoteApiRepository myNoteApiRepository;
  final prefs = serviceLocator<SharedPreferences>();

  MyNoteProvider({required this.myNoteApiRepository}) {
    getMyPosts();
  }

  List<PostModel> posts = [];
  CoinModel coinModel = CoinModel();

  int page = 1;
  int lastPage = 0;
  int size = 10;

  bool _isScrap = false;

  bool get isScrap => _isScrap;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchUserCoin() async {
    final response = await myNoteApiRepository.fetchUserCoin(
        'Bearer ${prefs.getString(SharedPreferenceKey.userToken)!}');

    _loading = true;
    response.when(success: (success) {
      coinModel = success.data;
      _loading = false;
    }, error: (error) {});

    notifyListeners();
  }

  Future<void> initialGetMyPosts() async {
    page = 1;
    final response = await myNoteApiRepository.fetchMyPosts(
        'Bearer ${prefs.getString(SharedPreferenceKey.userToken)!}',
        page,
        size);

    response.when(
        success: (success) {
          posts = success.data.posts!;
          //posts.sort(((a, b) => b.updatedAt.compareTo(a.updatedAt)));
          lastPage = success.data.pagenation?.lastPage ?? 0;
          notifyListeners();
        },
        error: (error) {});
  }

  Future<void> getMyPosts() async {
    final response = await myNoteApiRepository.fetchMyPosts(
        'Bearer ${prefs.getString(SharedPreferenceKey.userToken)!}',
        page,
        size);

    response.when(
        success: (success) {
          posts = posts + success.data.posts!;
          lastPage = success.data.pagenation?.lastPage ?? 0;
          notifyListeners();
        },
        error: (error) {});
    notifyListeners();
  }

  Future<void> scrap(String postId) async {
    await myNoteApiRepository.scarpPost(
      'Bearer $getToken',
      {
        'post_id': postId,
      },
    );
    initialGetMyPosts();
    notifyListeners();
  }

  Future<void> selectScrap(String postId) async {
    await scrap(postId);
    _isScrap = !_isScrap;

    notifyListeners();
  }

  bool get isLastPage {
    return page == lastPage || lastPage == 0;
  }

  void deletePost(int? postId) {
    posts.removeWhere((e) => e.postId == postId);

    notifyListeners();
  }
}
