import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool isValid;
  final String hintText;
  final String helperText;
  final String validText;
  final bool? obscureText;
  final Widget? suffix;

  const AuthTextFormField({
    Key? key,
    this.controller,
    this.onFieldSubmitted,
    required this.isValid,
    required this.hintText,
    this.validText = '',
    this.helperText = '',
    this.validator,
    this.obscureText,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: TextStyle(
        fontFamily: 'Pretendard',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: LookNoteColors.black[100],
      ),
      obscureText: obscureText ?? false,
      cursorColor: LookNoteColors.black[100],
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LookNoteColors.black[40]!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LookNoteColors.black[40]!),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: LookNoteColors.black[40],
        ),
        errorBorder:  const UnderlineInputBorder(
          borderSide: BorderSide(
            color: LookNoteColors.noticeRed,
            width: 1.5,
          ),
        ),
        errorStyle: const TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: LookNoteColors.noticeRed,
        ),
        helperText: isValid ? validText : helperText,
        helperStyle: TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w700,
          fontSize: 12,
          color: isValid ? LookNoteColors.noticeBlue : LookNoteColors.black[100],
        ),
        suffixIcon: suffix,
        suffixIconConstraints: const BoxConstraints(),
      ),
    );
  }
}
