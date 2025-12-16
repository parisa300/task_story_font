
import 'package:flutter/material.dart';

class MomentLayerPainter extends CustomPainter {
  final String period;
  final String title;
  final List<Color> colors;
  final double rotationAngle;

  MomentLayerPainter({required this.period,
    required this.title,
    required this.colors,
    required this.rotationAngle});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(55));

    canvas.drawRRect(rrect, Paint()..color = const Color(0xFF080808));

    final paintGlow = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 45
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 25)
      ..shader = SweepGradient(
        center: Alignment.center,
        colors: [colors[0], colors[1], colors[2], colors[0]],
        stops: const [0.0, 0.25, 0.75, 1.0],
      ).createShader(rect);

    canvas.save();
    canvas.clipRRect(rrect);
    canvas.drawRRect(rrect, paintGlow);

    final paintRightFade = Paint()
      ..shader = RadialGradient(
        center: const Alignment(1.0, 0.5),
        radius: 0.8,
        colors: [colors.last.withOpacity(0.5), Colors.transparent],
      ).createShader(rect);
    canvas.drawRRect(rrect, paintRightFade);
    canvas.restore();

    _drawStraightText(canvas, size, period, 14, Colors.white60, 35, FontWeight.w500);
    _drawStraightText(canvas, size, title, 24, Colors.white, size.height / 2 + 15, FontWeight.bold);
  }

  void _drawStraightText(Canvas canvas, Size size, String text, double fontSize, Color color, double yOffset, FontWeight weight) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: TextStyle(color: color, fontSize: fontSize, fontWeight: weight, height: 1.1)),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: size.width - 60);

    canvas.save();
    canvas.translate(size.width / 2, yOffset);
    canvas.rotate(-rotationAngle); //
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
