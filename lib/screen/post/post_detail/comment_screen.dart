import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/constants/colors.dart';
import '../../../app/resource/resource.dart';
import '../../../providers/posts/comment_provider.dart';
import 'components/bottom_text_form_field.dart';
import 'components/comment_container.dart';
import 'components/comment_smart_refresher.dart';

class CommentScreen extends StatelessWidget {
  final int postId;

  const CommentScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LookNoteColors.backgroundNeutral,
      appBar: LookNoteAppBar(
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
        },
        title: 'comment',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => context.read<CommentProvider>().onEditingComplete(context),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CommentSmartRefresher(
                  postId: postId,
                  child: CustomScrollView(
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([
                        CommentContainer(postId: postId),
                        size80,
                      ]))
                    ],
                  ),
                ),
              ),
              BottomTextFormField(postId: postId),
            ],
          ),
        ),
      ),
    );
  }
}
