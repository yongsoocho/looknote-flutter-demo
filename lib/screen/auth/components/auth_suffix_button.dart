import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';

class AuthSuffixButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isActive;
  const AuthSuffixButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isActive ? onPressed : () {},
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: isActive ? LookNoteColors.black[100] : LookNoteColors.black[20],
        shape: const BeveledRectangleBorder(),
        padding: const EdgeInsets.only(top: 6, bottom: 7),
        elevation: 0,
        fixedSize: const Size.fromWidth(100),
      ),
    );
  }
}
