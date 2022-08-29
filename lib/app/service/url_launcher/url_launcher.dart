import 'package:looknote/app/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  UrlLauncherService._();


 static Future<void> gotoPointShop() async {
    const url = coinShopUrl;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void>  gotoPointNotice() async {
    const url =
        pointNoticeUrl;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }


  static Future<void>  gotoAppStore() async {
    const url =
        storeUrl;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

}