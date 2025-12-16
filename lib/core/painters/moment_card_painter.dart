
import 'package:flutter/material.dart';
import 'moment_layout_painter.dart';

class MomentCard extends StatelessWidget {
  final String period;
  final String title;
  final List<Color> accentColors;
  final double angle;

  const MomentCard({super.key, required this.period, required this.title, required this.accentColors, required this.angle});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: CustomPaint(
        size: const Size(350, 175),
        painter: MomentLayerPainter(
          period: period,
          title: title,
          colors: accentColors,
          rotationAngle: angle,
        ),
      ),
    );
  }
}


