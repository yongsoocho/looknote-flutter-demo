import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/di/service_locator.dart';
import '../../app/service/auth/auth_token_helper.dart';
import '../../data/remote/network/model/post/post_model.dart';
import '../../domain/repository/my_note_api_repository.dart';

class ScrapProvider extends ChangeNotifier {
  final MyNoteApiRepository myNoteApiRepository;
  final prefs = serviceLocator<SharedPreferences>();

  ScrapProvider({required this.myNoteApiRepository}) {
    getPosts();
  }

  List<PostModel> posts = [];
  int page = 1;
  int lastPage = 0;
  int size = 10;

  Future<void> initialGetPosts() async {
    page = 1;
    final response = await myNoteApiRepository.fetchScrapPosts('Bearer ${AuthTokenHelper.getToken()}', page, size);

    response.when(
        success: (success) {
          posts = success.data.posts!;
          posts.sort(((a, b) => b.updatedAt.compareTo(a.updatedAt)));

          lastPage = success.data.pagenation?.lastPage ?? 0;
        },
        error: (error) {});

    notifyListeners();
  }

  Future<void> getPosts() async {
    final response = await myNoteApiRepository.fetchScrapPosts('Bearer ${AuthTokenHelper.getToken()}', page, size);

    response.when(
        success: (success) {
          posts = posts + success.data.posts!;

          posts.sort(((a, b) => b.updatedAt.compareTo(a.updatedAt)));
          lastPage = success.data.pagenation?.lastPage ?? 0;
        },
        error: (error) {});
    notifyListeners();
  }

  Future<void> updatePost({required PostModel post}) async {
    final isAlreadyScrapped = posts.where((e) => e.postId == post.postId).isNotEmpty;
    if (isAlreadyScrapped) {
      posts.removeWhere((e) => e.postId == post.postId);
    } else {
      posts.insert(0, post.copyWith(isScrap: true, scrap: post.scrap + 1));
    }
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
