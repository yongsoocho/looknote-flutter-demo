import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/components/app_bar/look_note_appbar.dart';
import '../../../app/config/routes/routes.dart';
import '../../../app/constants/colors.dart';
import '../../../app/di/service_locator.dart';
import '../../../providers/looknote_providers.dart';
import '../../auth/components/auth_text_form_field.dart';
import '../../auth/sign_up/local/sign_up_constants.dart';
import '../../auth/sign_up/widgets/select_container.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final AuthProvider _authProvider;
  late final EditProfileProvider _editProfileProvider;
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _authProvider = context.read<AuthProvider>();
    _editProfileProvider = context.read<EditProfileProvider>();

    final userModel = _authProvider.userModel!;
    _editProfileProvider.name = userModel.name;
    _editProfileProvider.gender = userModel.gender;
    _editProfileProvider.birth = '${userModel.dateOfBirth}';

    _textEditingController = TextEditingController(text: _editProfileProvider.name)
      ..addListener(() {
        _editProfileProvider.name = _textEditingController.text;
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editProfileProvider = context.watch<EditProfileProvider>();

    return Scaffold(
      appBar: LookNoteAppBar(
        title: '프로필 수정',
        actions: TextButton(
          onPressed: () => _editProfileProvider.editProfile(
            authProvider: _authProvider,
            sharedPreferences: serviceLocator<SharedPreferences>(),
          ),
          child: Text(
            '저장',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: LookNoteColors.blue[100],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이름',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: LookNoteColors.black[40],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AuthTextFormField(
                    controller: _textEditingController,
                    hintText: '',
                    isValid: true,
                  ),
                  SelectContainer(
                    picker: SizedBox(
                      height: 200,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        children: List.generate(
                          genderStatus.values.length,
                          (index) => Center(child: Text(genderStatus.values.toList()[index])),
                        ),
                        onSelectedItemChanged: (index) => _editProfileProvider.selectGender(index),
                      ),
                    ),
                    title: '성별 (선택)',
                    hintText: '성별을 선택해주세요.',
                    selected: editProfileProvider.selectdGender,
                  ),
                  const SizedBox(height: 30),
                  SelectContainer(
                    picker: SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        minimumYear: 1950,
                        maximumYear: DateTime.now().year,
                        dateOrder: DatePickerDateOrder.ymd,
                        initialDateTime: DateTime(2000, 1, 1),
                        onDateTimeChanged: (date) => _editProfileProvider.selectBirth(date),
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                    title: '생년월일 (선택)',
                    hintText: '생년월일을 선택해주세요.',
                    selected: editProfileProvider.selectdBirth,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, LookNoteRouteNames.deleteUser),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        '회원 탈퇴하기',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: LookNoteColors.black[100],
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          )
        ],
      ),
      backgroundColor: LookNoteColors.backgroundNeutral,
    );
  }
}
