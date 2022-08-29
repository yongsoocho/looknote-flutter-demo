import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/constants/colors.dart';

import '../../../../app/resource/resource.dart';

class PostDetailNickNameView extends StatelessWidget {
  const PostDetailNickNameView({
    Key? key,
    required this.onPressed,
    required this.nickName,
    this.isMine = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String nickName;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: isMine ? onPressed : () {},
      child: Padding(
        padding: horizontal20,
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Text(nickName,
                  style: button2.copyWith(color: LookNoteColors.pink[100])),
              isMine ? SvgPicture.asset(
                rightPinkArrowIcon,
                width: 24,
                height: 24,
              ) : Container()
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ),
    );
  }
}
