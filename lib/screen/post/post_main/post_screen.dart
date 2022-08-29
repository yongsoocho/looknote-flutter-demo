import 'package:flutter/material.dart';
import 'package:looknote/providers/posts/post_provider.dart';
import 'package:looknote/screen/post/post_main/components/post_app_bar.dart';
import 'package:looknote/screen/post/post_main/components/post_list_view.dart';
import 'package:provider/provider.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  static const String routeName = '/feedview';

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().initialGetPosts();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
                  _scrollController.position.maxScrollExtent &&
          context.read<PostProvider>().page !=
              context.read<PostProvider>().lastPage ) {
        context.read<PostProvider>().page += 1;

        Future.delayed(const Duration(milliseconds: 100)).then((value) async {
          await context.read<PostProvider>().getPosts();
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
    PostProvider feedViewModel = context.watch<PostProvider>();
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PostAppBar(),
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
