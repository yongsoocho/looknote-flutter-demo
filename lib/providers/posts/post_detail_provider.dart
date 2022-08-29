import 'package:flutter/material.dart';
import 'package:looknote/app/utils/logger.dart';

import '../../app/service/auth/auth_token_helper.dart';
import '../../data/remote/network/model/post/post_detail_model.dart';
import '../../domain/repository/my_note_api_repository.dart';
import '../../domain/repository/post_api_repository.dart';

class PostDetailProvider with ChangeNotifier {
  final PostApiRepository postApiRepository;
  final MyNoteApiRepository myNoteApiRepository;

  PostDetailProvider({required this.postApiRepository, required this.myNoteApiRepository});

  PostDetailModel? _postDetail;

  PostDetailModel? get postDetail => _postDetail;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isScrap = false;

  bool get isScrap => _isScrap;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getPostDetail({required int postId}) async {
    print('${_postDetail} 포스트 디테일은?');
    final response = await postApiRepository.fetchPostDetail(
      'Bearer ${AuthTokenHelper.getToken()}',
      {
        'post_id': postId,
      },
    );
    response.when(
        success: (success) {

          print('${success} 포스트 디테일은?');
          _postDetail = success.data;
          _isScrap = success.data.isScrap;

        },
        error: (error) {

          print('${error} 포스트 디테일은?');

        });

    notifyListeners();
  }

  Future<void> deletePost() async {
    await postApiRepository.deletePost(
      'Bearer ${AuthTokenHelper.getToken()}',
      {
        'post_id': _postDetail?.postId,
      },
    );
    notifyListeners();
  }

  Future<void> scrap() async {
    await myNoteApiRepository.scarpPost(
      'Bearer ${AuthTokenHelper.getToken()}',
      {
        'post_id': _postDetail?.postId,
      },
    );
    notifyListeners();
  }

  Future<void> selectScrap() async {
    await scrap();
    _isScrap = !_isScrap;
    notifyListeners();
  }
}
