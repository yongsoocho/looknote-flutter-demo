import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/resource/resource.dart';

class LookNoteBottomButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;
  final String title;

  const LookNoteBottomButton({
    Key? key,
    required this.isActive,
    required this.onPressed,
    this.title = nextButtonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 87,
      decoration: BoxDecoration(
        color: isActive ? LookNoteColors.black[100] : LookNoteColors.black[40],
      ),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary:
              isActive ? LookNoteColors.black[100] : LookNoteColors.black[40],
          padding: const EdgeInsets.only(top: 20, bottom: 40),
        ),
      ),
    );
  }
}
