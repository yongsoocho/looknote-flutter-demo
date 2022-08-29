import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/fonts.dart';


class BottomSheetButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;

  const BottomSheetButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor = LookNoteColors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: body1.copyWith(
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: const EdgeInsets.only(top: 15, bottom: 16),
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
