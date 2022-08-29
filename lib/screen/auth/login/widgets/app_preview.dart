import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import '../../Login/widgets/login_widgets.dart';

class AppPreview extends StatelessWidget {
  const AppPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        const _OrDivider(),
        const SizedBox(height: 28),
        LoginTextButton(
          onPressed: () => Navigator.pushNamed(context, LookNoteRouteNames.home),
          text: '앱 먼저 둘러보기',
        ),
        const SizedBox(height: 71),
      ],
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: LookNoteColors.black[40],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'or',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: LookNoteColors.black[40],
            ),
          ),
        ),
        Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: LookNoteColors.black[40],
          ),
        ),
      ],
    );
  }
}
