import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../resource/fonts.dart';

class DrawerTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool hasIcon;

  const DrawerTextButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Text(
              title,
              style: button2,
            ),
            Visibility(
              visible: hasIcon,
              child: Icon(
                Icons.arrow_drop_down,
                color: LookNoteColors.black[100],
                size: 22,
              ),
            )
          ],
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.only(top: 11, bottom: 14),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: NoSplash.splashFactory,
      ),
    );
  }
}
