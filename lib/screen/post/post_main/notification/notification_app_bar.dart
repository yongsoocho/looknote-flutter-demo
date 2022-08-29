import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
class NotificationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotificationAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      leading: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: LookNoteColors.black[100],
            ),
          ),
          Text('알림',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: LookNoteColors.black[100],
              ))
        ],
      ),
      border: null,
    );
  }
}
