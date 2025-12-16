
import 'package:flutter/material.dart';

class FancyTextPainter extends CustomPainter {
  final String text;
  final double scale;

  FancyTextPainter({
    required this.text,
    required this.scale,
  });

  static const _fontFamily = 'Lalezar';
  static const _baseFontSize = 72.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (text.trim().isEmpty) return;

    final baseStyle = TextStyle(
      fontFamily: _fontFamily,
      fontSize: _baseFontSize * scale,
      letterSpacing: -1,
    );

    final maxWidth = size.width * 0.9;

    final painters = [
      _createPainter(
        style: baseStyle.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 20
            ..color = const Color(0xff23b6b7),
        ),
        maxWidth: maxWidth,
      ),
      _createPainter(
        style: baseStyle.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 14
            ..color = Colors.black,
        ),
        maxWidth: maxWidth,
      ),
      _createPainter(
        style: baseStyle.copyWith(
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.grey.shade600,
        ),
        maxWidth: maxWidth,
      ),
      _createPainter(
        style: baseStyle.copyWith(color: Colors.white),
        maxWidth: maxWidth,
      ),
    ];

    final offset = Offset(
      (size.width - painters.last.width) / 2,
      (size.height - painters.last.height) / 2,
    );

    for (final painter in painters) {
      painter.paint(canvas, offset);
    }
  }

  TextPainter _createPainter({
    required TextStyle style,
    required double maxWidth,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      maxLines: null,
    );
    painter.layout(maxWidth: maxWidth);
    return painter;
  }

  @override
  bool shouldRepaint(covariant FancyTextPainter oldDelegate) {
    return oldDelegate.text != text || oldDelegate.scale != scale;
  }
}
