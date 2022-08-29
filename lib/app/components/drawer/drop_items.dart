import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/asset_path.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/app/constants/url.dart';
import 'package:looknote/app/di/service_locator.dart';
import 'package:looknote/app/service/package_info/pagkage_info_manager.dart';
import 'package:looknote/screen/auth/terms_of_use/terms_of_use_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resource/resource.dart';

class DropItems extends StatelessWidget {
  const DropItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = serviceLocator<SharedPreferences>();
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ItemTextButton(
            text: '서비스이용약관',
            onPressed: () => Navigator.pushNamed(
              context,
              LookNoteRouteNames.terms,
              arguments: {
                'title': termsOfUse[1].title,
                'url': termsOfUse[1].url,
              },
            ),
          ),
          const SizedBox(height: 27),
          _ItemTextButton(
            text: '개인정보처리방침',
            onPressed: () => Navigator.pushNamed(
              context,
              LookNoteRouteNames.terms,
              arguments: {
                'title': termsOfUse[0].title,
                'url': termsOfUse[0].url,
              },
            ),
          ),
          const SizedBox(height: 27),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '버전정보',
                style: body1.copyWith(
                  color: LookNoteColors.black[100],
                ),
              ),
              Text(
                'v${prefs.getString(VersionInfo.version.name)}',
                style: workSansCaption3.copyWith(
                  color: LookNoteColors.black[40],
                ),
              ),
            ],
          ),
          const SizedBox(height: 27),
          _ItemTextButton(
            text: '인스타그램 바로가기',
            onPressed: () async => await launch(LookNoteUrl.instagram),
            hasIcon: true,
          ),
        ],
      ),
    );
  }
}

class _ItemTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool hasIcon;

  const _ItemTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: hasIcon,
          child: Row(
            children: [
              Image.asset(
                '${ImagePath.drawer}/instagram.png',
                width: 16,
                height: 16,
                color: LookNoteColors.black[80],
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: body1.copyWith(
              color: LookNoteColors.black[100],
            ),
          ),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ],
    );
  }
}
