import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/components/loading/common_loading.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/colors.dart';
import '../../../app/resource/resource.dart';
import '../../../providers/my_note/my_note_provider.dart';
import '../../post/post_main/components/post_list_view.dart';
import 'components/my_note_point_view.dart';
import 'components/mynote_app_bar.dart';

class MyNoteScreen extends StatefulWidget {
  const MyNoteScreen({Key? key, required this.globalKey}) : super(key: key);
  final GlobalKey<ScaffoldState> globalKey;
  static const String routeName = '/mynoteview';

  @override
  _MyNoteScreenState createState() => _MyNoteScreenState();
}

class _MyNoteScreenState extends State<MyNoteScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<MyNoteProvider>().initialGetMyPosts();
    context.read<MyNoteProvider>().fetchUserCoin();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          context.read<MyNoteProvider>().page !=
              context.read<MyNoteProvider>().lastPage) {
        context.read<MyNoteProvider>().page += 1;

        Future.delayed(const Duration(milliseconds: 100)).then((value) async {
          await context.read<MyNoteProvider>().getMyPosts();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MyNoteProvider _myNoteProvider = context.watch<MyNoteProvider>();
    return _myNoteProvider.loading ? const CommonLoading() : Scaffold(
      appBar: MyNoteAppBar(globalKey: widget.globalKey),
      body: Column(
        children: [
          size10,
          const MyNotePointView(),
          size10,
          if (context.watch<MyNoteProvider>().posts.isNotEmpty) ...[
            Expanded(
                child: RefreshIndicator(
              onRefresh: context.read<MyNoteProvider>().initialGetMyPosts,
              child: PostListView(
                postScreenType: PostScreenType.myNote,
                isLastPage: _myNoteProvider.isLastPage,
                posts: context.read<MyNoteProvider>().posts,
                scrollController: _scrollController,
              ),
            ))
          ] else ...[
            const EmptyMyNote()
          ]
        ],
      ),
    );
  }
}

class EmptyMyNote extends StatelessWidget {
  const EmptyMyNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SvgPicture.asset(black100DoubleStackedCoinIcon),
          const SizedBox(
            height: 20,
          ),
          Text(
            '내 스타일 공유하고',
            style: button3.copyWith(color: LookNoteColors.black[90]),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Airpods Max',
                  style: button3.copyWith(color: blue100),
                ),
                TextSpan(
                  text: ' 응모하기',
                  style: button3.copyWith(color: LookNoteColors.black[90]),
                )
              ],
            ),
          ),
          size40,
          SvgPicture.asset(black100LongBottomArrowIcon),
          size40,
        ],
      ),
    );
  }
}
