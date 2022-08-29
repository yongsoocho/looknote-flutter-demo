import 'package:flutter/material.dart';
import 'package:looknote/app/resource/resource.dart';


class CustomPopUpMenuItem extends StatelessWidget {
  const CustomPopUpMenuItem({
    Key? key,
    required this.image,
    required this.title,
    required this.itemPressed,
  }) : super(key: key);

  final String image;
  final String title;
  final VoidCallback itemPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: itemPressed,
      child: SizedBox(
        height: 47,
        width: 122,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: body2.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
