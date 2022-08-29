import 'package:flutter/material.dart';
import 'package:looknote/app/components/dialog/look_note_alert_dialog.dart';
import 'package:looknote/screen/mynote/my_note_main/components/share_bottom_sheet.dart';
import 'package:looknote/screen/post/post_detail/post_detail_screen.dart';
import 'package:provider/provider.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';
import '../../../../providers/my_note/my_note_provider.dart';
import '../../../../providers/posts/post_detail_provider.dart';
import '../../../../providers/posts/post_provider.dart';
import '../../../../providers/scarp/scrap_provider.dart';

class DeleteBottomSheet extends StatelessWidget {
  const DeleteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postDetailProvider = context.read<PostDetailProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BottomSheetItem(
          title: '공유하기',
          onPressed: () {
            showModalBottomSheet(
              enableDrag: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.white,
              context: context,
              builder: (BuildContext bottomSheetDialog) {
                return const ShareBottomSheet();
              },
            );
          },
          titleColor: LookNoteColors.black[100]!,
        ),
        BottomSheetItem(
          title: '삭제하기',
          onPressed: () async {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => LookNotAlertDialog(
                text: '보드를 삭제하시겠습니까?',
                textStyle: body1,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      '취소',
                      style: body1,
                    ),
                  ),
                  SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: LookNoteColors.black[20],
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context)
                        ..pop()
                        ..pop();
                      FocusScope.of(context).unfocus();
                      postDetailProvider.isLoading = false;

                      await postDetailProvider.deletePost().whenComplete(() async {
                        postDetailProvider.isLoading = true;
                        context
                            .read<MyNoteProvider>()
                            .deletePost(postDetailProvider.postDetail?.postId);
                        context
                            .read<PostProvider>()
                            .deletePost(postDetailProvider.postDetail?.postId);
                        context
                            .read<ScrapProvider>()
                            .deletePost(postDetailProvider.postDetail?.postId);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text(
                      '삭제',
                      style: body1.copyWith(color: LookNoteColors.noticeRed),
                    ),
                  ),
                ],
              ),
            );

          },
          titleColor: LookNoteColors.noticeRed,
        ),
        Container(
          height: 42,
          color: Colors.white,
        )
      ],
    );
  }
}
