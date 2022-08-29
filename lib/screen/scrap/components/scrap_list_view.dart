import 'package:flutter/material.dart';
import 'package:looknote/data/remote/network/model/scarp/scrap_model.dart';
import 'package:looknote/screen/post/post_main/components/post_view.dart';

class ScrapListView extends StatelessWidget {
  const ScrapListView({
    Key? key,
    required this.scraps,
    required this.scrollController,
  }) : super(key: key);

  final List<ScrapModel> scraps;
  final ScrollController scrollController;


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: scraps.length,
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.83),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            PostView(posts: scraps[index].post!),
          ],
        );
      },
    );
  }
}
