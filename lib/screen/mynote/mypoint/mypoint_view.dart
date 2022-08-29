import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/colors.dart';
import '../../../app/di/service_locator.dart';
import '../../../app/resource/resource.dart';
import '../../../app/service/url_launcher/url_launcher.dart';
import '../../../providers/looknote_providers.dart';
import '../../../providers/my_note/my_note_provider.dart';
import 'mypoint_app_bar.dart';

class MyPointView extends StatefulWidget {
  const MyPointView({Key? key}) : super(key: key);

  static const String routeName = '/mypointview';

  @override
  State<MyPointView> createState() => _MyPointViewState();
}

class _MyPointViewState extends State<MyPointView> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().userModel;
    final coinModel = context.watch<MyNoteProvider>().coinModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyPointAppBar(),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 70,
              decoration: BoxDecoration(color: blackNatural, border: Border(bottom: BorderSide(width: 1, color: LookNoteColors.black[20]!))),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '누적 달란트',
                      style: body1,
                    ),
                    const Spacer(),
                    Text(
                      '${coinModel.coinSum}',
                      style: title2.copyWith(color: LookNoteColors.black[40]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              height: 70,
              decoration: const BoxDecoration(
                color: blackNatural,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '사용 가능한 달란트',
                      style: body1,
                    ),
                    const Spacer(),
                    Text(
                      '${coinModel.coin}',
                      style: title2.copyWith(color: LookNoteColors.black[100]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                UrlLauncherService.gotoPointShop();
                serviceLocator<FirebaseAnalytics>().logEvent(
                  name: 'click_move_to_coin_shop',
                  parameters: user?.toJson(),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 48,
                decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 1, color: LookNoteColors.black[20]!)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text('룩노트 스토어 바로가기', style: button2.copyWith(color: blue100)),
                    const Spacer(),
                    SvgPicture.asset(blueRightArrowIcon),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            _CoinInfo(
              title: '달란트는 무엇인가요?',
              contents: Text.rich(
                TextSpan(
                  text: '달란트는 looknote에서 ',
                  style: body1.copyWith(color: LookNoteColors.black[80]!),
                  children: const [
                    TextSpan(
                        text: '현금처럼 사용 가능한 리워드',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(
                      text: '입니다.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            _CoinInfo(
              title: '달란트는 어떻게 모으나요?',
              contents: Text(
                '나의 코디를 공유해주세요!\n보드 업로드만 해도 10 달란트를 받을 수 있습니다.\n사람들이 나의 스타일링에 공감한다면, 더 많은 보상을 받을 수 있어요.',
                style: body1.copyWith(color: LookNoteColors.black[80]!),
              ),
            ),
            const SizedBox(height: 30),
            _CoinInfo(
              title: '달란트는 어디에 사용할 수 있을까요?',
              contents: Text(
                '에어팟 맥스, 생로랑 카드지갑 등에 응모하는 것부터\n원하는 상품을 구매하는데 사용할 수 있어요.\n지금 바로 룩노트 스토어 바로가기 버튼을 클릭해보세요.',
                style: body1.copyWith(color: LookNoteColors.black[80]!),
              ),
            ),
            const SizedBox(height: 170),
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  child: GestureDetector(
                    onTap: () {
                      UrlLauncherService.gotoPointNotice();
                    },
                    child: Text(
                      '달란트 관련 공지사항 더보기',
                      style: button3.copyWith(
                        color: LookNoteColors.black[80],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}

class _CoinInfo extends StatelessWidget {
  final String title;
  final Widget contents;

  const _CoinInfo({
    Key? key,
    required this.title,
    required this.contents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: body3.copyWith(
                color: LookNoteColors.black[80],
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            contents,
          ],
        ),
      ),
    );
  }
}
