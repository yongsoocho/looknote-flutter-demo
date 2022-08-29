import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/screen/bottom_navigation/bottom_navigation_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/components/button/look_note_bottom_button.dart';
import '../../../app/components/dialog/look_note_alert_dialog.dart';
import '../../../app/config/routes/routes.dart';
import '../../../app/constants/colors.dart';
import '../../../app/di/service_locator.dart';

import '../../../app/resource/resource.dart';
import '../../../providers/looknote_providers.dart';
import 'drawer_contants.dart';

class DeleteUserScreen extends StatefulWidget {
  const DeleteUserScreen({Key? key}) : super(key: key);

  @override
  State<DeleteUserScreen> createState() => _DeleteUserScreenState();
}

class _DeleteUserScreenState extends State<DeleteUserScreen> {
  late final DeleteUserProvider _deleteUserProvider;

  @override
  void initState() {
    _deleteUserProvider = context.read<DeleteUserProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deleteUserProvider = context.watch<DeleteUserProvider>();

    return Scaffold(
      appBar: const LookNoteAppBar(
        title: '회원탈퇴',
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              SizedBox(height: 20),
              _DeleteReason(),
              SizedBox(height: 27),
              _DeleteCheck(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: LookNoteBottomButton(
          title: '완료',
          isActive: deleteUserProvider.isValid,
          onPressed: () {
            showCupertinoDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) => LookNotAlertDialog(
                text: '등록된 모든 정보는\n탈퇴 후 복구가 불가능합니다.\n탈퇴하시겠습니까?',
                textStyle: body1,
                actions: [
                  _AlertTextButton(
                    onPressed: () => Navigator.pop(context),
                    text: cancelButtonTitle,
                    textColor: LookNoteColors.black[100]!,
                  ),
                  SizedBox(
                    height: 48,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: LookNoteColors.black[20],
                    ),
                  ),
                  _AlertTextButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      await _deleteUserProvider.deleteUser(
                        authProvider: context.read<AuthProvider>(),
                        sharedPreferences: serviceLocator<SharedPreferences>(),
                      );


                      showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => const LookNotAlertDialog(
                          text: withdrawalUser,
                          textStyle: body1,
                        ),
                      );
                      context.read<BottomNavigationViewModel>().screenIndex = 0;
                      Navigator.pushNamed(context, LookNoteRouteNames.login);
                    },
                    text: '탈퇴',
                    textColor: LookNoteColors.noticeRed,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class _DeleteReason extends StatelessWidget {
  const _DeleteReason({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '탈퇴사유',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: LookNoteColors.black[60],
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            context.read<DeleteUserProvider>().isClickedDropDown = !context.read<DeleteUserProvider>().isClickedDropDown;
          },
          child: Row(
            children: [
              Text(
                context.watch<DeleteUserProvider>().reason.isEmpty ? '탈퇴사유를 선택해주세요.' : context.watch<DeleteUserProvider>().reason,
                style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: context.watch<DeleteUserProvider>().reason.isEmpty ? LookNoteColors.black[40] : LookNoteColors.black[100],
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_drop_down,
                color: LookNoteColors.black[40],
                size: 24,
              )
            ],
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(left: 17, top: 15, right: 22, bottom: 16),
            shape: BeveledRectangleBorder(
              side: BorderSide(color: LookNoteColors.black[40]!),
            ),
          ),
        ),
        Visibility(
          visible: context.watch<DeleteUserProvider>().isClickedDropDown,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              deleteReasons.length,
              (index) => _DeleteElevatedButton(text: deleteReasons[index]),
            ),
          ),
        )
      ],
    );
  }
}

class _DeleteElevatedButton extends StatelessWidget {
  final String text;

  const _DeleteElevatedButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deleteUserProvider = context.read<DeleteUserProvider>();
    return InkWell(
      onTap: () {
        deleteUserProvider.isClickedDropDown = !deleteUserProvider.isClickedDropDown;
        deleteUserProvider.reason = text;
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 16,
          top: 12,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.7,
            color: LookNoteColors.black[40]!,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: LookNoteColors.black[100]),
        ),
      ),
    );
  }
}

class _AlertTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onPressed;

  const _AlertTextButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: textColor,
        ),
      ),
    );
  }
}

class _DeleteCheck extends StatelessWidget {
  const _DeleteCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '탈퇴신청',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: LookNoteColors.black[60],
          ),
        ),
        const SizedBox(height: 13),
        Text(
          '탈퇴 후 활동 정보를 제외한 모든 개인 정보 및 룩노트 서비스 이용기록은 모두 삭제 되며 삭제된 데이터는 복구되지 않습니다. 회원 탈퇴 후에는 계정을 복구할 수 없습니다. ',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: LookNoteColors.black[100],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            height: 2,
            thickness: 2,
            color: LookNoteColors.black[100],
          ),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              splashRadius: 1.0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              activeColor: LookNoteColors.blue[100],
              checkColor: Colors.white,
              value: context.watch<DeleteUserProvider>().isChecked,
              onChanged: (bool? value) {
                context.read<DeleteUserProvider>().isChecked = value!;
              },
            ),
            Text(
              '위 내용을 모두 확인하였습니다.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: LookNoteColors.black[80],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
