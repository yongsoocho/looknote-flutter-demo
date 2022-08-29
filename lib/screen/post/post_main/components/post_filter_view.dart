import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:looknote/app/resource/fonts.dart';
import 'package:looknote/app/resource/icons.dart';
import 'package:looknote/providers/posts/post_provider.dart';
import 'package:provider/provider.dart';


class PostFilterView extends StatefulWidget {
  const PostFilterView({
    Key? key,
  }) : super(key: key);

  @override
  State<PostFilterView> createState() => _PostFilterViewState();
}

class _PostFilterViewState extends State<PostFilterView> {
  String dropdownValue = '등록순';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            height: 40,
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: SvgPicture.asset(blackBottomArrowIcon),
              style: button3,
              underline: const SizedBox(),
              onChanged: (String? newValue) {
                context.read<PostProvider>().page = 1;
                if (newValue == '등록순') {
                  context.read<PostProvider>().getPosts();
                } else {
                  context.read<PostProvider>().getPosts(postType: PostType.popular);
                }

                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['등록순', '인기순']
                  .map<DropdownMenuItem<String>>((String value) {


                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
