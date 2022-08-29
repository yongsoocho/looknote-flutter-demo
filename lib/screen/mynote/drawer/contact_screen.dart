import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:looknote/app/components/app_bar/look_note_appbar.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/constants/url.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LookNoteAppBar(
        title: 'Contact',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '아래 채널을 통해 문의 또는 건의 사항을 남겨주시면\n최대한 빠르게 답변해 드리겠습니다.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: LookNoteColors.black,
              ),
            ),
            const SizedBox(height: 24),
            _ContactContents(
              title: '카카오톡',
              address: '@take_looknote',
              buttonText: '연락 하기',
              onPressed: () async => await launch(LookNoteUrl.kakaoChannel),
            ),
            const SizedBox(height: 24),
            _ContactContents(
              title: '이메일',
              address: 'looknote.official@befferent.co.kr',
              buttonText: '주소 복사',
              onPressed: () async {
               await Clipboard.setData(const ClipboardData(text: 'looknote.official@befferent.co.kr'));
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const Dialog(
                      child: SizedBox(
                        height: 120,
                        width: 215,
                        child: Center(
                          child: Text('클립보드에 복사되었습니다'),
                        ),
                      )
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}

class _ContactContents extends StatelessWidget {
  final String title;
  final String address;
  final String buttonText;
  final VoidCallback onPressed;

  const _ContactContents({
    Key? key,
    required this.title,
    required this.address,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: LookNoteColors.black[100],
          ),
        ),
        const SizedBox(width: 6),
        Text(
          address,
          style: const TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LookNoteColors.black,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: LookNoteColors.black[100],
              borderRadius: BorderRadius.circular(0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 6.0),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
