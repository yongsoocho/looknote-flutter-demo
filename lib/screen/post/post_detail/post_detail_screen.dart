import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/screen/post/post_detail/components/post_detail_nick_name_view.dart';
import 'package:provider/provider.dart';
import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/constants/colors.dart';
import '../../../app/resource/resource.dart';
import '../../../data/remote/network/model/post/post_model.dart';
import '../../../providers/looknote_providers.dart';
import '../../../providers/posts/comment_provider.dart';
import 'components/cody_image.dart';
import 'components/community_widgets.dart';
import 'components/delete_bottom_sheet.dart';
import 'components/post_scrap_icon_with_date_view.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    Key? key,
    postId,
  }) : super(key: key);
  static const String routeName = '/community';

  @override
  _PostDetailScreen createState() => _PostDetailScreen();
}

class _PostDetailScreen extends State<PostDetailScreen> {
  late final AsyncMemoizer _memoizer;

  @override
  void initState() {
    _memoizer = AsyncMemoizer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postArgument =
        ModalRoute.of(context)!.settings.arguments as PostArgument;
    final userId = context.read<AuthProvider>().userModel?.userId;

    return FutureBuilder(
        future: _memoizer.runOnce(
          () async => await context.read<PostDetailProvider>().getPostDetail(
                postId: postArgument.post.postId,
              ),
        ),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            final postDetail = context.read<PostDetailProvider>().postDetail;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: LookNoteAppBar(
                  backgroundColor: Colors.white,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                  titleWidget: SafeArea(
                    child: Text(
                      'board',
                      style: title3.copyWith(
                        color: LookNoteColors.black[100],
                      ),
                    ),
                  ),
                  actions: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (bottomSheetContext) {
                            if (postDetail?.user?.userId == userId) {
                              return const DeleteBottomSheet();
                            } else {
                              return const ReportBottomSheet();
                            }
                          },
                        );
                      },
                      child: SvgPicture.asset(black100MoreIcon))),
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => context
                      .read<CommentProvider>()
                      .onEditingComplete(context),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate([
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: LookNoteColors.black[20],
                              ),
                              PostDetailNickNameView(
                                onPressed: () {
                                   Navigator.pushNamed(
                                    context,
                                    LookNoteRouteNames.searchResultPost,
                                    arguments: {'userModel': postDetail?.user},
                                  );
                                },
                                nickName: postDetail?.user?.nickname ?? '',
                                isMine: postDetail?.user?.userId != userId,
                              ),
                              CodyImage(post: postArgument.post),
                              size10,
                              PostScarpIconWithDateView(
                                  post: postArgument.post),
                              Padding(
                                padding: horizontal16,
                                child: CommentContainer(
                                  hasLimit: true,
                                  postId: postArgument.post.postId,
                                ),
                              ),
                              size80
                            ]),
                          ),
                        ],
                      ),
                      BottomTextFormField(postId: postArgument.post.postId),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.titleColor,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: LookNoteColors.black[5]!, width: 1),
          ),
        ),
        height: 42,
        child: Center(
          child: Text(
            title,
            style: body2.copyWith(
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}

class PostArgument {
  PostModel post;

  PostArgument({required this.post});
}
