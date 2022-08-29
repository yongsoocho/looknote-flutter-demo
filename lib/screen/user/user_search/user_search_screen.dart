import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/config/size/size_config.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/providers/user/user_search_provider.dart';
import 'package:provider/provider.dart';
import '../../../app/config/routes/routes.dart';
import '../../../app/resource/resource.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);

  static const String routeName = '/searchPost';

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _searchText = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    UserSearchProvider _userSearchProvider =
        context.watch<UserSearchProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                size8,
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(backButtonIcon)),
                size16,
                SizedBox(
                  height: 40,
                  width: SizeConfig().screenWidth - 64,
                  child: CupertinoSearchTextField(
                    onSubmitted: (value) async {
                      await context.read<UserSearchProvider>().searchUser();
                    },
                    onChanged: _userSearchProvider.validationSearch,
                    borderRadius: BorderRadius.circular(0),
                    suffixMode: OverlayVisibilityMode.editing,
                    controller: _searchText,
                  ),
                ),
              ],
            ),
            size16,
            Visibility(
              visible: _userSearchProvider.userModel != null,
              child: SizedBox(
                height: SizeConfig().safeAreaHeight - 100,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: LookNoteColors.black[10]!)),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: _userSearchProvider
                                            .userModel?.nickname ??
                                        '',
                                    style: button2.copyWith(
                                        color: LookNoteColors.pink[100]),
                                  ),
                                  TextSpan(
                                    text: "'s note",
                                    style: body1.copyWith(
                                        color: LookNoteColors.black[100]),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  LookNoteRouteNames.searchResultPost,
                                  arguments: {
                                    'userModel': _userSearchProvider.userModel
                                  },
                                );
                              },
                              child: Text(
                                '보러가기',
                                style: subTitle3.copyWith(
                                    color: LookNoteColors.black[40]),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
