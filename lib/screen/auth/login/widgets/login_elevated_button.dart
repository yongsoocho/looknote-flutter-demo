import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';

class LoginElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? primaryColor;

  const LoginElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
        primary: primaryColor ?? LookNoteColors.black[100],
        shape:  const BeveledRectangleBorder(
          side: BorderSide(
            color: LookNoteColors.black,
            width: 0.5,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 13),
        elevation: 0,
      ),
    );
  }
}
