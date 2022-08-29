import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:looknote/app/config/size/size_config.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';

class ShareBottomSheetItem extends StatelessWidget {
  const ShareBottomSheetItem({
    Key? key,
    required this.isLeft,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
    required this.bubbleIcon,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;
  final VoidCallback onPressed;
  final String bubbleIcon;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: svg_provider.Svg(bubbleIcon), fit: BoxFit.cover),
            ),
            width: SizeConfig().screenWidth / 2 - 30,
            height: 130,
            child: Column(
              children: [
                size20,
                Text(
                  title,
                  style: subTitle3.copyWith(color: LookNoteColors.black[100]),
                ),
                size16,
                Text(
                  description,
                  style: button3.copyWith(color: LookNoteColors.black[100]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          size10,
          Align(
            alignment: !isLeft ? Alignment.bottomLeft : Alignment.bottomRight,
            child: InkWell(
              onTap: onPressed,
              child: SvgPicture.asset(image),
            ),
          )
        ],
      ),
    );
  }
}
