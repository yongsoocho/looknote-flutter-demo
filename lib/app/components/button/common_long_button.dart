import 'package:flutter/material.dart';

import '../../resource/fonts.dart';

class CommonLongButton extends StatelessWidget {
  const CommonLongButton({
    Key? key,
    required this.buttonTitle,
    required this.buttonTitleColor,
    required this.buttonBackgroundColor,
    required this.onPressed,
    this.buttonBorderColor = Colors.transparent,
    this.buttonLogoImage,
  }) : super(key: key);

  final String buttonTitle;
  final Color buttonTitleColor;
  final Color buttonBackgroundColor;
  final Color? buttonBorderColor;
  final Widget? buttonLogoImage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          border: Border.all(color: buttonBorderColor!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buttonLogoImage ?? const SizedBox(),
            Center(
              child: Text(
                buttonTitle,
                style: button2.copyWith(color: buttonTitleColor),
              ),
            ),
            Opacity(
              opacity: 0,
              child: buttonLogoImage ?? const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
