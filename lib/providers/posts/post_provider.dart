import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app/service/auth/auth_token_helper.dart';
import '../../data/remote/network/model/post/post_model.dart';
import '../../domain/repository/post_api_repository.dart';

enum PostType { normal, popular }

class PostProvider with ChangeNotifier {
  final PostApiRepository postApiRepository;

  PostProvider({required this.postApiRepository}) {
    getPosts();
  }

  List<PostModel> posts = [];
  int page = 1;
  int lastPage = 0;
  int size = 10;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> initialGetPosts() async {
    page = 1;
    var response = await postApiRepository.fetchPosts('Bearer ${AuthTokenHelper.getToken()}', page, size);
    _isLoading = true;
    response.when(
        success: (success) {
          posts = success.data.posts!;
          lastPage = success.data.pagenation?.lastPage ?? 0;
          _isLoading = false;
        },
        error: (error) {});
    notifyListeners();
  }

  Future<void> getPosts({PostType postType = PostType.normal}) async {
    if (postType == PostType.normal) {
      var response = await postApiRepository.fetchPosts('Bearer ${AuthTokenHelper.getToken()}', page, size);
      _isLoading = true;
      response.when(
          success: (success) {
            posts = posts + success.data.posts!;
            lastPage = success.data.pagenation?.lastPage ?? 1;

            _isLoading = false;
          },
          error: (error) {});

      notifyListeners();
    } else {
      var response = await postApiRepository.fetchPostPopularity('Bearer ${AuthTokenHelper.getToken()}', page, size);
      posts = [];
      response.when(
          success: (success) {
            posts = posts + success.data.posts!;
            lastPage = success.data.pagenation?.lastPage ?? 1;
            notifyListeners();
          },
          error: (error) {});
    }
  }

  Future<void> updatePost({required PostModel post}) async {
    if (posts.contains(post)) {
      final isScrapped = posts.firstWhere((e) => e.postId == post.postId).isScrap;
      final postIndex = posts.indexWhere((e) => e.postId == post.postId);

      if (isScrapped) {
        posts[postIndex] = post.copyWith(isScrap: false, scrap: post.scrap - 1);
      } else {
        posts[postIndex] = post.copyWith(isScrap: true, scrap: post.scrap + 1);
      }
      notifyListeners();
    }
  }

  bool get isLastPage {
    return page == lastPage || lastPage == 0;
  }

  void deletePost(int? postId) {
    posts.removeWhere((e) => e.postId == postId);

    notifyListeners();
  }
}
