import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:looknote/app/components/dialog/look_note_alert_dialog.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/app/service/url_launcher/url_launcher.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  static const String routeName = '/update';

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) {
            return LookNotAlertDialog(
                text: '업데이트가 필요합니다',
                textStyle: body1,
                actions: [
                  TextButton(
                    onPressed: () async {
                      await UrlLauncherService.gotoAppStore();

                      if (Platform.isIOS) {
                        exit(0);
                      } else {
                        SystemNavigator.pop();
                      }
                    },
                    child: Text('업데이트 하기',
                        style:
                            body1.copyWith(color: LookNoteColors.black[100])),
                  ),
                ]);
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
