import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../app/constants/colors.dart';
import '../../../../../app/resource/resource.dart';

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({
    Key? key,
    required this.userName,
    required this.description,
    required this.imageUrl,
    required this.date,
  }) : super(key: key);

  final String userName;
  final String description;
  final String imageUrl;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: vertical16Horizontal20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: userName, style: body3),
                  TextSpan(text: '님이 회원님의 $description', style: body2),
                ]),
              ),
              Text(
                date,
                style: body2.copyWith(color: LookNoteColors.black[40]),
              )
            ],
          ),
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: 40,
            height: 48,
          )
        ],
      ),
    );
  }
}
