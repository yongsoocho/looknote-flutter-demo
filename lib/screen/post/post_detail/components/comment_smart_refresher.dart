import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../providers/posts/comment_provider.dart';

class CommentSmartRefresher extends StatefulWidget {
  final Widget child;
  final int postId;

  const CommentSmartRefresher({
    Key? key,
    required this.child,
    required this.postId,
  }) : super(key: key);

  @override
  State<CommentSmartRefresher> createState() => _CommentSmartRefresherState();
}

class _CommentSmartRefresherState extends State<CommentSmartRefresher> {
  late final CommentProvider _commentProvider;

  @override
  void initState() {
    _commentProvider = context.read<CommentProvider>();
    _commentProvider.refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _commentProvider.disposeRefreshController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _commentProvider.refreshController,
      header: const ClassicHeader(
        idleText: '',
        failedText: '',
        completeText: '',
        canTwoLevelText: '',
        refreshingText: '',
        releaseText: '',
        releaseIcon: SizedBox(),
        idleIcon: SizedBox(),
        failedIcon: SizedBox(),
        completeIcon: SizedBox(),
        refreshingIcon: SizedBox(),
        canTwoLevelIcon: SizedBox(),
        height: 0,
        completeDuration: Duration.zero,
      ),
      footer: CustomFooter(
        loadStyle: LoadStyle.HideAlways,
        builder: (context, state) => Container(),
      ),
      onRefresh: () => _commentProvider.onRefresh(postId: widget.postId),
      onLoading: () => _commentProvider.onLoading(postId: widget.postId),
      child: widget.child,
    );
  }
}
