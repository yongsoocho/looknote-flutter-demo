import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/looknote_providers.dart';
import '../../config/routes/routes.dart';
import '../../constants/colors.dart';
import '../../resource/fonts.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthProvider>().userModel;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: OutlinedButton(
        onPressed: () => user == null
            ? Navigator.pushNamed(
                context,
                LookNoteRouteNames.login,
                arguments: {'isFromPreview': true},
              )
            : Navigator.pushNamed(context, LookNoteRouteNames.editProfile),
        child: Text(
          '프로필 수정',
          style: button3.copyWith(color: LookNoteColors.black[100]),
          textAlign: TextAlign.center,
        ),
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          side: BorderSide(color: LookNoteColors.black[40]!),
          splashFactory: NoSplash.splashFactory,
        ),
      ),
    );
  }
}
