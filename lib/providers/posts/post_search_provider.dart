import 'package:flutter/material.dart';
import 'package:looknote/domain/repository/post_api_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/di/service_locator.dart';
import '../../app/service/auth/auth_token_helper.dart';
import '../../data/remote/network/model/post/post_model.dart';

class PostSearchProvider extends ChangeNotifier {
  final PostApiRepository postApiRepository;
  final prefs = serviceLocator<SharedPreferences>();

  PostSearchProvider({required this.postApiRepository});
  List<PostModel> posts = [];
  int page = 1;
  int lastPage = 0;
  int size = 10;

  Future<void> initialGetPosts(int userId) async {
    page = 1;
    posts = [];
    final request = {
      'user_id' : userId
    };
    final response = await postApiRepository.fetchPostsByUserId(
        'Bearer ${AuthTokenHelper.getToken()}',request, page, size);

    response.when(
        success: (success) {
          posts = success.data.posts!;
          posts.sort(((a, b) => b.updatedAt.compareTo(a.updatedAt)));

          lastPage = success.data.pagenation?.lastPage ?? 0;
        },
        error: (error) {});

    notifyListeners();
  }

  Future<void> getPosts(int userId) async {
    final request = {
      'user_id' : userId
    };
    final response = await postApiRepository.fetchPostsByUserId(
        'Bearer ${AuthTokenHelper.getToken()}',request, page, size);

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
    final isAlreadyScrapped =
        posts.where((e) => e.postId == post.postId).isNotEmpty;
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
}
