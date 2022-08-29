import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/data/remote/network/model/user/user_model.dart';
import 'package:looknote/providers/posts/post_provider.dart';
import 'package:looknote/providers/posts/post_search_provider.dart';
import 'package:looknote/screen/post/post_main/components/post_list_view.dart';
import 'package:provider/provider.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';

import '../../../app/resource/resource.dart';

class OtherUserScreen extends StatefulWidget {
  const OtherUserScreen({Key? key, required this.userModel})
      : super(key: key);

  final UserModel userModel;

  static const String routeName = '/searchResultPost';

  @override
  _OtherUserScreenState createState() => _OtherUserScreenState();
}

class _OtherUserScreenState extends State<OtherUserScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await context
          .read<PostSearchProvider>()
          .initialGetPosts(widget.userModel.userId);
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          context.read<PostSearchProvider>().page !=
              context.read<PostSearchProvider>().lastPage) {
        context.read<PostSearchProvider>().page += 1;

        Future.delayed(const Duration(milliseconds: 100)).then((value) async {
          await context
              .read<PostSearchProvider>()
              .getPosts(widget.userModel.userId);
        });
      }
    });
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    PostSearchProvider feedViewModel = context.watch<PostSearchProvider>();
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  size8,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(backButtonIcon),
                  ),
                  size10,
                  Text(
                    widget.userModel.nickname,
                    style: workSansHead2.copyWith(color: LookNoteColors.pink),
                  ),
                  const Text(
                    "'s note",
                    style: workSansHead2,
                  )
                ],
              ),
              size16,
              Expanded(
                child: RefreshIndicator(
                  onRefresh: context.read<PostProvider>().initialGetPosts,
                  child: PostListView(
                      isLastPage: feedViewModel.isLastPage,
                      posts: feedViewModel.posts,
                      scrollController: _scrollController),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
