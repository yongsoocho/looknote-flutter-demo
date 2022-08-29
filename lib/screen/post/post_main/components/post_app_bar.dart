import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/config/routes/routes.dart';
import '../../../../app/resource/resource.dart';

class PostAppBar extends StatelessWidget {
  const PostAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            size16,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('boards',style: head1,),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      LookNoteRouteNames.searchPost,
                    );
                  },
                  child: SvgPicture.asset(searchIcon),
                ),
              ],
            ),
            //size12,
            //const PostFilterView(),
            size10,
          ],
        ),
      ),
    );
  }
}
