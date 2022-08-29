import 'package:flutter/cupertino.dart';
import 'package:looknote/providers/auth/sign_up/sign_up_providers.dart';
import 'package:provider/provider.dart';
import '../local/sign_up_constants.dart';
import 'sign_up_widgets.dart';

class GenderAndAgeForm extends StatelessWidget {
  const GenderAndAgeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genderAgeProvider = context.read<GenderAgeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 58),
        SelectContainer(
          picker: SizedBox(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 50,
              children: List.generate(
                genderStatus.values.length,
                (index) => Center(child: Text(genderStatus.values.toList()[index])),
              ),
              onSelectedItemChanged: (index) => genderAgeProvider.selectGender(index),
            ),
          ),
          title: '성별 (선택)',
          hintText: '성별을 선택해주세요.',
          selected: context.watch<GenderAgeProvider>().selectdGender,
        ),
        const SizedBox(height: 30),
        SelectContainer(
          picker: SizedBox(
            height: 250,
            child: CupertinoDatePicker(
              minimumYear: 1950,
              maximumYear: DateTime.now().year,
              initialDateTime: DateTime(2000, 1, 1),
              onDateTimeChanged: (date) => genderAgeProvider.selectBirth(date),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          title: '생년월일 (선택)',
          hintText: '생년월일을 선택해주세요.',
          selected: context.watch<GenderAgeProvider>().selectdBirth,
        ),
      ],
    );
  }
}
