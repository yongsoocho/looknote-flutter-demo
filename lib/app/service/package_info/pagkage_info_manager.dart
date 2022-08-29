import 'package:looknote/app/di/service_locator.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum VersionInfo { version , buildNumber }

class PackageInfoManager {
  PackageInfoManager._();


  static getVersionInfo() async {
    final prefs = serviceLocator<SharedPreferences>();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;


    prefs.setString(VersionInfo.version.name, version);
    prefs.setString(VersionInfo.buildNumber.name, buildNumber);

  }
}
