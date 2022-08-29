import 'package:flutter/material.dart';
import 'package:looknote/app/components/dialog/look_note_alert_dialog.dart';
import 'package:looknote/app/constants/colors.dart';
import '../../../../app/resource/fonts.dart';
import '../../../../app/resource/resource.dart';
import 'package:looknote/screen/post/post_detail/post_detail_screen.dart';
import '../../../../app/constants/colors.dart';

class ReportBottomSheet extends StatelessWidget {
  const ReportBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BottomSheetItem(
          title: '신고하기',
          onPressed: () => _confirmReport(context),
          titleColor: LookNoteColors.black[100]!,
        ),
        Container(
          height: 42,
          color: Colors.white,
        )
      ],
    );
  }

  Future<dynamic> _confirmReport(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => LookNotAlertDialog(
        text: '이 보드를 신고하시겠습니까? ',
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
            onPressed: () {
              Navigator.of(context)
                ..pop()
                ..pop();

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SizedBox(
                        height: 120,
                        width: 215,
                        child: Center(
                          child: Text(
                            '신고 접수가 완료되었습니다.',
                            style: body1,
                          ),
                        ),
                      ));
                },
              );
            },
            child: Text(
              '신고',
              style: body1.copyWith(color: LookNoteColors.noticeRed),
            ),
          ),
        ],
      ),
    );
  }
}
