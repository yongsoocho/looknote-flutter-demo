import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/config/routes/routes.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';

class MyNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyNoteAppBar({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;

  @override
  Size get preferredSize => const Size.fromHeight(44);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text(
          'my note',
          style: head1,
        ),
      ),
      trailing: Row(
        children: [
          const Spacer(),
          InkWell(onTap: () {
            Navigator.pushNamed(
              context,
              LookNoteRouteNames.notificationView,
            );
          },child: SvgPicture.asset(notificationIcon)),
          size20,
          SizedBox(
            width: 25,
            height: 25,
            child: GestureDetector(
              child: Icon(
                CupertinoIcons.line_horizontal_3,
                size: 25,
                color: LookNoteColors.black[100],
              ),
              onTap: () {
                globalKey.currentState?.openEndDrawer();
              },
            ),
          )
        ],
      ),
      border: null,
    );
  }
}
