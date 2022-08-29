import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../app/service/auth/auth_token_helper.dart';
import '../../app/utils/date_format_utils.dart';
import '../../data/remote/network/model/comment/comment_model.dart';
import '../../domain/repository/post_api_repository.dart';
import '../looknote_providers.dart';

class CommentProvider with ChangeNotifier {
  final PostApiRepository postApiRepository;

  CommentProvider({required this.postApiRepository});

  late RefreshController refreshController;
  int _currentPage = 1;
  bool _isLastPage = false;

  bool _isHintTextVisible = true;
  bool _isSubmitVisible = false;
  String inputComment = '';

  final List<CommentModel> _comments = [];

  List<CommentModel> get comments => _comments;

  bool get isHintTextVisible => _isHintTextVisible;

  bool get isSubmitVisible => _isSubmitVisible;

  void onTapTextFormField() {
    _isHintTextVisible = false;
    _isSubmitVisible = true;

    notifyListeners();
  }

  void onEditingComplete(BuildContext context) {
    FocusScope.of(context).unfocus();
    _isSubmitVisible = false;
    _isHintTextVisible = true;

    notifyListeners();
  }

  Future<void> getComments(int postId) async {
    const pageSize = 30;
    final response = await postApiRepository.fetchComments(
      'Bearer ${AuthTokenHelper.getToken()}',
      '$postId',
      _currentPage,
      pageSize,
    );
    response.when(
        success: (success) {
          List<CommentModel> commentData = success.data.comments ?? [];
          commentData = commentData.map((e) => e.copyWith(updatedAt: DateFormatUtils.createdTime(DateTime.parse(e.updatedAt)))).toList();
          _comments.addAll(commentData);

          if (_currentPage > success.data.pagenation!.lastPage) {
            _isLastPage = true;
          } else {
            _currentPage += 1;
          }
        },
        error: (error) {});

    notifyListeners();
  }

  Future<void> submitComment(
    BuildContext context,
    TextEditingController textEditingController,
    int postId,
  ) async {
    final content = textEditingController.text;

    _isHintTextVisible = true;
    _isSubmitVisible = false;
    if (content.isEmpty) return;

    final Map<String, dynamic> request = {
      'content': content,
      'post_id': postId,
    };

    final response = await postApiRepository.createComment('Bearer ${AuthTokenHelper.getToken()}', request);

    response.when(
        success: (success) async {
          _comments.add(CommentModel(
            content: inputComment,
            updatedAt: DateFormatUtils.createdTime(DateTime.now()),
            user: context.read<AuthProvider>().userModel,
          ));

          inputComment = '';
          textEditingController.text = '';

          notifyListeners();
        },
        error: (error) {});

    notifyListeners();
  }

  void initPagenation() {
    _comments.clear();
    _currentPage = 1;
    _isLastPage = false;
  }

  Future<void> onRefresh({required int postId}) async {
    initPagenation();
    getComments(postId);
    refreshController.refreshCompleted();
  }

  Future<void> onLoading({required int postId}) async {
    if (!_isLastPage) {
      getComments(postId);
      refreshController.loadComplete();
    }
  }

  void disposeRefreshController() {
    if (refreshController.headerMode != null && refreshController.footerMode != null) {
      refreshController.dispose();
    }
  }
}
