import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';

import '../../providers/scarp/scrap_provider.dart';
import '../post/post_main/components/post_list_view.dart';
import 'components/scrap_app_bar.dart';

class ScrapScreen extends StatefulWidget {
  const ScrapScreen({Key? key}) : super(key: key);

  static const String routeName = '/scrapview';

  @override
  _ScrapScreenState createState() => _ScrapScreenState();
}

class _ScrapScreenState extends State<ScrapScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ScrapProvider>().initialGetPosts();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && context.read<ScrapProvider>().page != context.read<ScrapProvider>().lastPage) {
        context.read<ScrapProvider>().page += 1;

        Future.delayed(const Duration(milliseconds: 100)).then((value) async {
          await context.read<ScrapProvider>().getPosts();
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
    ScrapProvider _scrapProvider = context.watch<ScrapProvider>();
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScrapAppBar(),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: context.read<ScrapProvider>().initialGetPosts,
                  child: PostListView(
                    isLastPage: _scrapProvider.isLastPage,
                    posts: _scrapProvider.posts,
                    scrollController: _scrollController,
                    postScreenType: PostScreenType.scrap,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
