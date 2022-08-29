import 'package:flutter/material.dart';
import 'package:looknote/app/config/routes/routes.dart';
import 'package:looknote/app/constants/colors.dart';
import 'package:looknote/data/remote/network/model/terms_of_use/terms_info.dart';



class AgreeTermsContainer extends StatelessWidget {
  final TermsInfo terms;
  final bool isChecked;
  final void Function(bool?) onChanged;

  const AgreeTermsContainer({
    Key? key,
    required this.terms,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          activeColor: LookNoteColors.blue[100],
          checkColor: Colors.white,
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(
          '(${terms.isRequired ? '필수' : '선택'}) ${terms.title}',
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: LookNoteColors.black[80],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => Navigator.pushNamed(
            context,
            LookNoteRouteNames.terms,
            arguments: {
              'title': terms.title,
              'url': terms.url,
            },
          ),
          icon: const Icon(Icons.arrow_forward_ios),
          iconSize: 18,
          splashRadius: 1,
          color: LookNoteColors.black[60],
        ),
      ],
    );
  }
}
