import 'dart:math';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';
import '../../../../providers/looknote_providers.dart';
import '../../../../providers/posts/comment_provider.dart';
import 'community_widgets.dart';

class CommentContainer extends StatefulWidget {
  final bool hasLimit;
  final int postId;

  const CommentContainer({
    Key? key,
    this.hasLimit = false,
    required this.postId,
  }) : super(key: key);

  @override
  State<CommentContainer> createState() => _CommentContainerState();
}

class _CommentContainerState extends State<CommentContainer> {
  late final AsyncMemoizer _memoizer;
  late final CommentProvider _commentProvider;

  @override
  void initState() {
    _memoizer = AsyncMemoizer();
    _commentProvider = context.read<CommentProvider>()..initPagenation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const maxCount = 5;

    return FutureBuilder(
      future: _memoizer.runOnce(() async => await _commentProvider.getComments(widget.postId)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final comments = context.watch<CommentProvider>().comments;

          return CustomScrollView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final comment = comments[index];

                      return _Comment(
                        nickname: comment.user?.nickname ?? '',
                        text: comment.content,
                        time: comment.updatedAt,
                        isOtherUser: comment.user?.userId != context.read<AuthProvider>().userModel?.userId,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemCount: widget.hasLimit ? min(maxCount, comments.length) : comments.length,
                  ),
                  Visibility(
                    visible: widget.hasLimit && comments.length > maxCount,
                    child: MoreCommentButton(postId: widget.postId),
                  ),
                ]),
              ),
            ],
          );
        } else {
          return const Center(
            heightFactor: 5,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _Comment extends StatelessWidget {
  final String nickname;
  final String text;
  final String time;
  final bool isOtherUser;

  const _Comment({
    Key? key,
    required this.nickname,
    required this.text,
    required this.time,
    this.isOtherUser = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nickname,
          style: workSansCaption1.copyWith(
            color: isOtherUser ? LookNoteColors.pink[100] : LookNoteColors.black ,
          ),
        ),
        const SizedBox(height: 2),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4.0,
          children: [
            Text(text, style: workSansCaption3),
            Text(
              time,
              style: TextStyle(
                fontFamily: fontName,
                fontWeight: FontWeight.w400,
                fontSize: 10,
                color: LookNoteColors.black[40],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
