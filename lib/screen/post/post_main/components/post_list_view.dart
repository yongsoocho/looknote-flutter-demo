import 'package:flutter/material.dart';
import 'package:looknote/app/components/loading/common_loading.dart';

import '../../../../data/remote/network/model/post/post_model.dart';
import 'post_view.dart';

enum PostScreenType {
  post,
  scrap,
  myNote,
}

class PostListView extends StatelessWidget {
  const PostListView({
    Key? key,
    required this.posts,
    required this.scrollController,
    required this.isLastPage,
    this.postScreenType = PostScreenType.post,
  }) : super(key: key);

  final List<PostModel> posts;
  final bool isLastPage;
  final PostScreenType postScreenType;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: !isLastPage ? posts.length + 2 : posts.length,
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        childAspectRatio: 0.83,
      ),
      itemBuilder: (BuildContext context, int index) {
        if (index < posts.length) {
          return PostView(postScreenType: postScreenType, posts: posts[index]);
        } else {
          return !isLastPage ? const CommonLoading() : Container();
        }
      },
    );
  }
}
