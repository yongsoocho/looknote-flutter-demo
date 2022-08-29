import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';

class LookNoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleWidget;
  final Widget? actions;
  final String? title;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const LookNoteAppBar({
    Key? key,
    this.title,
    this.titleWidget,
    this.actions,
    this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: backgroundColor ?? LookNoteColors.backgroundNeutral,
      transitionBetweenRoutes: false,
      leading: GestureDetector(
        onTap: onTap ?? () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: LookNoteColors.black[100],
        ),
      ),
      middle: titleWidget ??
          Text(
            '$title',
            style: const TextStyle(color: LookNoteColors.black),
          ),
      border: null,
      trailing: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
