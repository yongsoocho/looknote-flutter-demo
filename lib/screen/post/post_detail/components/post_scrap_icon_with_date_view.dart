import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/utils/string_extension.dart';
import 'package:provider/provider.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/resource/resource.dart';
import '../../../../data/remote/network/model/post/post_model.dart';
import '../../../../providers/my_note/my_note_provider.dart';
import '../../../../providers/posts/post_provider.dart';
import '../../../../providers/scarp/scrap_provider.dart';

class PostScarpIconWithDateView extends StatefulWidget {
  final PostModel post;

  const PostScarpIconWithDateView({Key? key, required this.post}) : super(key: key);

  @override
  State<PostScarpIconWithDateView> createState() => _PostScarpIconWithDateViewState();
}

class _PostScarpIconWithDateViewState extends State<PostScarpIconWithDateView> {
  late int scrapCount;
  late bool scrap;

  @override
  void initState() {
    scrapCount = widget.post.scrap;
    scrap = widget.post.isScrap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.post.updatedAt.dateFormat(),
                style: workSansCaption2.copyWith(color: LookNoteColors.black[40]),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  await context.read<MyNoteProvider>().selectScrap('${widget.post.postId}');
                  await context.read<ScrapProvider>().updatePost(post: widget.post);
                  await context.read<PostProvider>().updatePost(post: widget.post);

                  setState(() {
                    scrap = !scrap;
                    if (!scrap) {
                      scrapCount -= 1;
                    } else {
                      scrapCount += 1;
                    }
                  });
                },
                child: Column(
                  children: [
                    SvgPicture.asset(scrap ? iconScrapBlackActive : iconScrapBlackInActive),
                    Text(
                      '$scrapCount',
                      style: workSansCaption2.copyWith(color: LookNoteColors.black[40]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
