import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants/colors.dart';
import '../../../../data/remote/network/model/post/post_model.dart';

class CodyImage extends StatelessWidget {
  final PostModel post;

  const CodyImage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: LookNoteColors.blackNeutral,
      child: CachedNetworkImage(fit: BoxFit.cover, imageUrl: post.imageURL[0]),
    );
  }
}
