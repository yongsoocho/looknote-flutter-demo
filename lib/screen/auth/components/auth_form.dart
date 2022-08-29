import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
class AuthForm extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const AuthForm({
    Key? key,
    required this.title,
    required this.description,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: LookNoteColors.black[90],
            ),
          ),
          const SizedBox(height: 9),
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: LookNoteColors.black,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
