import 'package:kakao_flutter_sdk_link/kakao_flutter_sdk_link.dart';

import '../../utils/logger.dart';

class KakaoShare {
  KakaoShare._();

  static Future<void> myNoteKakaoShare(
      {required String imageUrl,
      required String userName,
      required int scrapCount}) async {
    final FeedTemplate defaultFeed = FeedTemplate(
      content: Content(
        title: '$userName의 다른 보드도 궁금하다면 룩노트에 놀러오세요👇',
        imageUrl: Uri.parse(imageUrl),
        link: Link(
            webUrl: Uri.parse('https://developers.kakao.com'),
            mobileWebUrl: Uri.parse('https://apps.apple.com/kr/app/looknote/id1604553837')),
      ),
      social: Social(sharedCount: scrapCount),
      buttons: [
        Button(
          title: '앱으로보기',
          link: Link(
            androidExecutionParams: {'key1': 'value1', 'key2': 'value2'},
            iosExecutionParams: {'key1': 'value1', 'key2': 'value2'},
          ),
        ),
      ],
    );

    bool result = await LinkClient.instance.isKakaoLinkAvailable();
    if (result) {
      logger().i('카카오톡으로 카카오링크 공유하기 가능');
      try {
        Uri uri =
            await LinkClient.instance.defaultTemplate(template: defaultFeed);
        await LinkClient.instance.launchKakaoTalk(uri);
        logger().i('카카오링크 공유하기 완료');
      } catch (error) {
        logger().e('카카오링크 공유하기 실패 $error');
      }
    } else {
      try {
        Uri shareUrl = await WebSharerClient.instance
            .defaultTemplateUri(template: defaultFeed);
        await launchBrowserTab(shareUrl);
      } catch (error) {
        logger().e('카카오링크 공유하기 실패 $error');
      }
    }
  }
}
