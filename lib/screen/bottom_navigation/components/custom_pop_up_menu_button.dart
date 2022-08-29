import 'package:flutter/material.dart';

import 'custom_pop_up_menu_item.dart';

class CustomPopUpMenuButton extends StatelessWidget {
  const CustomPopUpMenuButton({
    Key? key,
    required this.itemButtonPressed,
    required this.boardButtonPressed,
  }) : super(key: key);

  final VoidCallback itemButtonPressed;
  final VoidCallback boardButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      color: Colors.black,
      child: Column(
        children: [
          CustomPopUpMenuItem(
            image: 'assets/images/bottom/clothes@2x.png',
            title: '아이템',
            itemPressed: itemButtonPressed,
          ),
          Container(
            color: const Color.fromARGB(255, 0, 0, 0),
            width: 106,
            height: 1,
          ),
          CustomPopUpMenuItem(image: 'assets/images/bottom/cody@2x.png', title: '보드', itemPressed: boardButtonPressed),
        ],
      ),
    );
  }
}
