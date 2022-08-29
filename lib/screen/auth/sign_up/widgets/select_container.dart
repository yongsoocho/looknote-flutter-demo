import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:looknote/app/constants/colors.dart';

class SelectContainer extends StatelessWidget {
  final Widget picker;
  final String title;
  final String hintText;
  final String? selected;

  const SelectContainer({
    Key? key,
    required this.picker,
    required this.title,
    required this.hintText,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: LookNoteColors.black[40],
          ),
        ),
        const SizedBox(height: 12),
        _SelectButton(
          picker: picker,
          hintText: hintText,
          selected: selected,
        ),
      ],
    );
  }
}

class _SelectButton extends StatelessWidget {
  final Widget picker;
  final String hintText;
  final String? selected;

  const _SelectButton({
    Key? key,
    required this.picker,
    required this.hintText,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selected != null;

    return OutlinedButton(
      onPressed: () => _onPressed(context),
      child: Row(
        children: [
          Text(
            selected ?? hintText,
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: isSelected ? LookNoteColors.black[100] : LookNoteColors.black[40],
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_drop_down,
            color: LookNoteColors.black[60],
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
    );
  }

  void _onPressed(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [picker],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('확인'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
