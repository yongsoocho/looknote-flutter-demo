import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/colors.dart';
import '../../../../providers/looknote_providers.dart';
import '../../../../providers/posts/comment_provider.dart';

class BottomTextFormField extends StatefulWidget {
  final int postId;

  const BottomTextFormField({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  State<BottomTextFormField> createState() => _BottomTextFormFieldState();
}

class _BottomTextFormFieldState extends State<BottomTextFormField> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.read<CommentProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: LookNoteColors.black[10]!),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: LookNoteColors.blackNeutral,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          readOnly: context.read<AuthProvider>().userModel == null,
          controller: _textEditingController,
          onTap: commentProvider.onTapTextFormField,
          onChanged: (String? value) {
            commentProvider.inputComment = value ?? '';
          },
          onEditingComplete: () {
            commentProvider.onEditingComplete(context);
            commentProvider.submitComment(
              context,
              _textEditingController,
              widget.postId,
            );
          },
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: LookNoteColors.black[100],
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 11, bottom: 13),
            prefixIcon: const _HintText(),
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: _SubmitButton(
              textEditingController: _textEditingController,
              postId: widget.postId,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: LookNoteColors.blackNeutral),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class _HintText extends StatelessWidget {
  const _HintText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.watch<CommentProvider>();
    final nickname = context.read<AuthProvider>().userModel?.nickname;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 11, bottom: 13),
      child: Visibility(
        visible: commentProvider.inputComment.isEmpty && commentProvider.isHintTextVisible,
        child: Text.rich(
          TextSpan(
            text: nickname,
            style: TextStyle(
              fontFamily: 'WorkSans',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: LookNoteColors.black[40],
            ),
            children: [
              TextSpan(
                text: '님 댓글을 남겨보세요',
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: LookNoteColors.black[40],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final TextEditingController textEditingController;
  final int postId;

  const _SubmitButton({
    Key? key,
    required this.textEditingController,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentProvider = context.read<CommentProvider>();
    return Visibility(
      visible: context.watch<CommentProvider>().isSubmitVisible,
      child: TextButton(
        onPressed: () {
          commentProvider.onEditingComplete(context);
          commentProvider.submitComment(
            context,
            textEditingController,
            postId,
          );
        },
        child: Text(
          '게시',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: LookNoteColors.blue[100],
          ),
        ),
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
        ),
      ),
    );
  }
}
