import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../app/config/routes/routes.dart';
import '../../../app/resource/icons.dart';
import '../../../providers/my_note/my_note_provider.dart';
import '../../../providers/posts/post_provider.dart';

class BottomNavigationAddButton extends StatefulWidget {
  const BottomNavigationAddButton({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationAddButton> createState() => _BottomNavigationAddButtonState();
}

class _BottomNavigationAddButtonState extends State<BottomNavigationAddButton> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        FloatingActionButton(
            highlightElevation: 0,
            focusColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            focusElevation: 0,
            splashColor: Colors.transparent,
            hoverElevation: 0,
            hoverColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.white,
            child: SvgPicture.asset(bottomNavAdd),
            onPressed: () async {
              await Navigator.pushNamed(context, LookNoteRouteNames.makePost).then((value) async {
                await context.read<PostProvider>().initialGetPosts();
                await context.read<MyNoteProvider>().initialGetMyPosts();
              });
            }),
      ],
    );
  }
}
