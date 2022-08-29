import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../resource/fonts.dart';

class LookNoteSpeechBubble extends StatelessWidget {
  final String text;
  final Color borderColor;

  const LookNoteSpeechBubble({
    Key? key,
    required this.text,
    this.borderColor = LookNoteColors.kakaoYellow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SpeechBubblePainter(color: borderColor),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        child: Text(
          text,
          style: subTitle3,
        ),
      ),
    );
  }
}

class _SpeechBubblePainter extends CustomPainter {
  Color color;

  _SpeechBubblePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.45, size.height);
    path.lineTo(size.width / 2, size.height + size.height / 3);
    path.lineTo(size.width * 0.55, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
