import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/components/dialog/look_note_alert_dialog.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/providers/looknote_providers.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/screen/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => LookNotAlertDialog(
            text: '로그아웃 하시겠습니까?',
            textStyle: body1,
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소',
                    style: body1.copyWith(color: LookNoteColors.black[100])),
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
                  context.read<BottomNavigationViewModel>().screenIndex = 0;
                  context.read<AuthProvider>().logout(
                      sharedPreferences: serviceLocator<SharedPreferences>());
                  Navigator.pushNamed(context, LookNoteRouteNames.login);
                },
                child: Text(
                  '로그아웃',
                  style: body1.copyWith(color: LookNoteColors.black[100]),
                ),
              )
            ],
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          '로그아웃',
          style: body1.copyWith(
            color: LookNoteColors.black[100],
          ),
        ),
      ),
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
