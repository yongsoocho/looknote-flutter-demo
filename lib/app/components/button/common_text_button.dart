import 'package:flutter/material.dart';

import '../../resource/fonts.dart';

class CommonTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final TextStyle titleStyle;

  const CommonTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.titleStyle = body2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: titleStyle,
        ));
  }
}
