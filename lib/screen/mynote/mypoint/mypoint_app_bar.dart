import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';

import '../../../app/resource/resource.dart';

class MyPointAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyPointAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: 200,
      leading: Row(
        children: [
          size16,
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: LookNoteColors.black[100],
            ),
          ),
          const Text(
            'my talent',
            style: workSansTitle2,
          )
        ],
      ),
    );
  }
}
