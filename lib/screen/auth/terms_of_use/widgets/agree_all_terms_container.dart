import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/providers/terms_of_use/terms_of_use_provider.dart';
import 'package:provider/provider.dart';


class AgreeAllTermsContainer extends StatelessWidget {
  const AgreeAllTermsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final termsOfUseProvider = context.read<TermsOfUseProvider>();
    return Container(
      color: LookNoteColors.blackNeutral,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: LookNoteColors.blue[100],
              checkColor: Colors.white,
              value: context.watch<TermsOfUseProvider>().isEntireChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  termsOfUseProvider.isEntireChecked = value;
                  termsOfUseProvider.isPrivateChecked = value;
                  termsOfUseProvider.isAgeChecked = value;
                  termsOfUseProvider.isMarketingChecked = value;
                }
              }),
          Text(
            '전체동의',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: LookNoteColors.black[100],
            ),
          )
        ],
      ),
    );
  }
}
