import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class LookNotAlertDialog extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final List<Widget>? actions;

  const LookNotAlertDialog({Key? key, required this.text, required this.textStyle, this.actions = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(
        top: 40,
        bottom: 29,
      ),
      title: Text(
        text,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
      content: Divider(
        height: 1,
        thickness: 1,
        color: LookNoteColors.black[20],
      ),
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      actions: actions!,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      buttonPadding: EdgeInsets.zero,
    );
  }
}
