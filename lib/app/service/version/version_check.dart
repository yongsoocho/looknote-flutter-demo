

import 'package:dio/dio.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/service/package_info/pagkage_info_manager.dart';
import 'package:looknote/data/remote/clients/version/version_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VersionCheck {
  VersionCheck._();

  static Future<bool> isForcedUpdate() async {
    final Dio dio = serviceLocator<Dio>();
    final SharedPreferences prefs = serviceLocator<SharedPreferences>();
    final VersionClient versionClient = VersionClient(dio);

    if (prefs.getString(VersionInfo.version.name) == null) {
      return false;
    }

    Map<String, dynamic> body = {
      'version': prefs.getString(VersionInfo.version.name)
    };

    final response = await versionClient.checkVersion(body);
    return response.data;
  }


}