import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/components/loading/common_loading.dart';
import 'package:provider/provider.dart';

import '../../../../app/config/routes/routes.dart';
import '../../../../app/constants/colors.dart';
import '../../../../app/resource/fonts.dart';
import '../../../../app/resource/icons.dart';
import '../../../../data/remote/network/model/post/post_model.dart';
import '../../../../providers/my_note/my_note_provider.dart';
import '../../../../providers/posts/post_provider.dart';
import '../../../../providers/scarp/scrap_provider.dart';
import '../../post_detail/post_detail_screen.dart';
import 'post_list_view.dart';

class PostView extends StatefulWidget {
  const PostView({
    Key? key,
    required this.posts,
    this.postScreenType = PostScreenType.post,
  }) : super(key: key);

  final PostModel posts;
  final PostScreenType postScreenType;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late bool isScrap;
  late final PostProvider _postProvider;
  late final MyNoteProvider _myNoteProvider;
  late final ScrapProvider _scrapProvider;

  @override
  void initState() {
    isScrap = widget.posts.isScrap;
    _postProvider = context.read<PostProvider>();
    _myNoteProvider = context.read<MyNoteProvider>();
    _scrapProvider = context.read<ScrapProvider>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: screenWidth * 1.2 / 2,
          width: screenWidth / 2,
          color: LookNoteColors.backgroundNeutral,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              LookNoteRouteNames.communityScreen,
              arguments: PostArgument(post: widget.posts),
            );
          },
          child: CachedNetworkImage(
            imageUrl: widget.posts.imageURL[0],
            height: screenWidth * 1.2 / 2,
            width: screenWidth / 2,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) => const CommonLoading(
            ),
          ),
        ),
        Visibility(
          visible: widget.postScreenType == PostScreenType.myNote,
          child: Positioned(
            top: 16,
            left: 16,
            child: Column(
              children: [
                SvgPicture.asset(iconScrapActive),
                Text(
                  '${widget.posts.scrap}',
                  style: button3.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.postScreenType != PostScreenType.myNote,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                await _myNoteProvider.selectScrap('${widget.posts.postId}');
                await _scrapProvider.updatePost(post: widget.posts);
                await _postProvider.updatePost(post: widget.posts);
                setState(() {
                  isScrap = !isScrap;
                });
              },
              child: Selector2<PostProvider, ScrapProvider, bool>(
                  builder: (context, isScrap, child) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SvgPicture.asset(
                          isScrap ? iconScrapActive : iconScrapInActive,
                        ),
                      ),
                  selector: (_, postState, scrapState) {
                    if (widget.postScreenType == PostScreenType.post) {
                      final targetPost = postState.posts.where((e) => e.postId == widget.posts.postId);
                      return targetPost.isEmpty ? false : targetPost.first.isScrap;
                    } else {
                      final targetPost = scrapState.posts.where((e) => e.postId == widget.posts.postId);
                      return targetPost.isEmpty ? false : targetPost.first.isScrap;
                    }
                  }),
            ),
          ),
        )
      ],
    );
  }
}
