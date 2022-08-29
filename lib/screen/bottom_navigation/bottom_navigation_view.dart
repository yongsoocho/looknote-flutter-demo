import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../app/components/drawer/look_note_drawer.dart';
import '../../app/resource/icons.dart';
import '../../app/resource/resource.dart';
import '../../providers/looknote_providers.dart';
import '../mynote/my_note_main/mynote_screen.dart';
import '../post/post_main/post_screen.dart';
import '../post/post_upload/post_upload_screen.dart';
import '../scrap/scrap_screen.dart';
import '../shop/shop_screen.dart';
import 'bottom_navigation_view_model.dart';
import 'components/bottom_navigation_add_button.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late List<dynamic> screens;
  bool visiblePopUpMenu = false;

  @override
  void initState() {
    context.read<AuthProvider>().localTokenLogin();

    screens = [
      MyNoteScreen(
        globalKey: _key,
      ),
      const ShopScreen(),
      const PostUploadScreen(),
      const PostScreen(),
      const ScrapScreen(),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<BottomNavigationViewModel>(context);
    int currentIndex = indexProvider.fetchCurrentScreenIndex;

    return Scaffold(
      key: _key,
      body: Center(
        child: screens[currentIndex],
      ),
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: const Drawer(
          child: LookNoteDrawer(),
        ),
      ),
      floatingActionButton: const BottomNavigationAddButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: indexProvider.updateScreenIndex,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(bottomNavMynoteInActive),
            activeIcon: SvgPicture.asset(bottomNavMynoteActive),
          ),

          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              iconCoinShopInActive,
            ),
            activeIcon: SvgPicture.asset(iconCoinShopActive),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              iconCoinShopInActive,
            ),
            activeIcon: SvgPicture.asset(iconCoinShopActive),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(bottomNavBoardsInActive),
            activeIcon: SvgPicture.asset(bottomNavBoardsActive),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(bottomNavScrapInActive),
            activeIcon: SvgPicture.asset(bottomNavScrapActive),
          ),

        ],
      ),
    );
  }
}
