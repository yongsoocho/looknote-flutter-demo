import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/di/service_locator.dart';
import '../../../../app/resource/resource.dart';
import '../../../../providers/auth_provider.dart';
import '../../../../providers/posts/post_upload_provider.dart';

class MakePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MakePostAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      leading: GestureDetector(
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      middle: const Text(
        'new board',
        style: title3,
      ),
      trailing: GestureDetector(
        child: const Text(
          '공유',
          style: TextStyle(color: noticeBlue, fontWeight: FontWeight.w600),
        ),
        onTap: () async {
          serviceLocator<FirebaseAnalytics>().logEvent(
            name: 'click_share_board',
            parameters: context.read<AuthProvider>().userModel?.toJson(),
          );
          context.read<PostUploadProvider>().isUploading = true;
          await context.read<PostUploadProvider>().uploadPost().whenComplete(() {
            context.read<PostUploadProvider>().isUploading = false;
            Navigator.of(context).pop();
          });
        },
      ),
      border: null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
