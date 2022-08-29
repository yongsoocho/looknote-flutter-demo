import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/looknote_providers.dart';
import '../../config/routes/routes.dart';
import '../../constants/colors.dart';
import '../../constants/url.dart';
import '../../resource/fonts.dart';
import 'drawer_widgets.dart';

class LookNoteDrawer extends StatefulWidget {
  const LookNoteDrawer({Key? key}) : super(key: key);

  @override
  State<LookNoteDrawer> createState() => _LookNoteDrawerState();
}

class _LookNoteDrawerState extends State<LookNoteDrawer> {
  bool isVisibleDropItems = false;

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().userModel;
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 54),
              Text(
                context.read<AuthProvider>().userModel != null ? '${user?.nickname}' : '로그인 해주세요',
                style: title2,
              ),
              if (context.read<AuthProvider>().userModel != null) ...[
                const EditProfileButton()
              ] else ...[
                const _LoginSignUpButton(),
              ],
              DrawerTextButton(
                title: 'Editor\'s Note',
                onTap: () async => await launch('https://looknote.notion.site/Editor-s-note-c5683ae9ba8848d18d1b54a01a6df684'),
              ),
              DrawerTextButton(
                title: 'FAQ',
                onTap: () async => await launch('https://looknote.notion.site/FAQ-064c615aeff84254ab6e4a381ea7407e'),
              ),
              DrawerTextButton(
                title: 'Contact',
                onTap: () => Navigator.pushNamed(context, LookNoteRouteNames.contact),
              ),
              DrawerTextButton(
                title: 'Rating & Review',
                onTap: () async => await launch(LookNoteUrl.appStore),
              ),
              DrawerTextButton(
                title: 'More',
                onTap: () {
                  setState(() {
                    isVisibleDropItems = !isVisibleDropItems;
                  });
                },
                hasIcon: true,
              ),
              Visibility(
                visible: isVisibleDropItems,
                child: const DropItems(),
              ),
              const Spacer(),
              const LogoutButton(),
              const SizedBox(height: 40),
            ],
          ),
        ));
  }
}

class _LoginSignUpButton extends StatelessWidget {
  const _LoginSignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(
          context,
          LookNoteRouteNames.login,
          arguments: {'isFromPreview': true},
        ),
        child: const Text(
          '로그인/회원가입',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(primary: LookNoteColors.black[100], shape: const RoundedRectangleBorder()),
      ),
    );
  }
}
