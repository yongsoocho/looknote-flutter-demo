import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';
import '../../../../app/service/share/kakao_share.dart';
import '../../../../data/remote/network/model/user/user_model.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/my_note/my_note_provider.dart';
import 'share_bottom_sheet_item.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyNoteProvider _myNoteProvider = context.watch<MyNoteProvider>();
    UserModel? userModel = context.read<AuthProvider>().userModel;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      height: 346,
      child: Column(
        children: [
          size20,
          Padding(
            padding: horizontal20,
            child: Row(
              children: [
                size20,
                const Spacer(),
                Text(
                  'my note 공유하기',
                  style: body2.copyWith(color: LookNoteColors.black[40]),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(black60CloseIcon),
                ),
              ],
            ),
          ),
          size16,
          Text(
            '나의 스타일을 더 많은 사람들과 나누고 싶다면?',
            style: subTitle.copyWith(color: LookNoteColors.black[100]),
          ),
          size32,
          Padding(
            padding: horizontal20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShareBottomSheetItem(
                    isLeft: true,
                    bubbleIcon: rightRectangleBubbleIcon,
                    title: '카카오톡으로 공유',
                    description: '내 보드로 바로가기\n메시지를 전송해보세요.',
                    image: circleKakaoTalkIcon,
                    onPressed: () async {
                      await KakaoShare.myNoteKakaoShare(
                        scrapCount: _myNoteProvider.posts[0].scrap,
                        userName: userModel?.nickname ?? '',
                        imageUrl: _myNoteProvider.posts[0].imageURL[0],
                      );
                    }),
                size16,
                ShareBottomSheetItem(
                    isLeft: false,
                    bubbleIcon: leftRectangleBubbleIcon,
                    title: '링크 복사',
                    description: '링크와 닉네임을 함께\n공유하면 더 찾기 쉬워요.',
                    image: circleLinkCopyIcon,
                    onPressed: () async {
                      await Clipboard.setData(const ClipboardData(
                          text: 'https://itunes.apple.com/app/id1604553837'));
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
                              ),
                            );
                          });
                    }),
              ],
            ),
          )

          //leftRectangleBubbleIcon
        ],
      ),
    );
  }
}
