import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/providers/posts/comment_provider.dart';
import 'package:provider/provider.dart';

import '../../../../app/resource/resource.dart';

class MoreCommentButton extends StatelessWidget {
  final int postId;

  const MoreCommentButton({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommentProvider _commentProvider = context.watch<CommentProvider>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(
          context,
          LookNoteRouteNames.commentScreen,
          arguments: {'postId': postId },
        ),
        child: Text(
          '${_commentProvider.comments.length - 5}개의 댓글 더보기 >',
          style: button3,
        ),
        style: TextButton.styleFrom(
          primary: LookNoteColors.black[80],
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
