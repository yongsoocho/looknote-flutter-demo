import 'package:device_info/device_info.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

enum DeviceInfo { device, version, uuid }

class DeviceInfoManager {
  DeviceInfoManager._();

  static getDeviceInfo() async {
    final prefs = serviceLocator<SharedPreferences>();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      prefs.setString(DeviceInfo.device.name, iosInfo.utsname.machine);
      prefs.setString(DeviceInfo.version.name, iosInfo.systemVersion);
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      prefs.setString(DeviceInfo.device.name, androidInfo.model);
      prefs.setString(DeviceInfo.version.name, androidInfo.version.release);
    }
  }
}
