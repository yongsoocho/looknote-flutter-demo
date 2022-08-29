import 'package:flutter/material.dart';
import '../../../app/resource/resource.dart';


class ScrapAppBar extends StatelessWidget {
  const ScrapAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 78,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 22,vertical: 10),
        child:  Text('scrap',style: head1,),
      ),
    );
  }
}
