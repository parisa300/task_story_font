
import 'package:flutter/material.dart';

import '../../../../core/painters/fancy_text_painter.dart';


class FancyTextWidget extends StatelessWidget {
  final String text;
  final double scale;

  const FancyTextWidget({super.key, required this.text, required this.scale});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FancyTextPainter(text: text, scale: scale),
      child: const SizedBox.expand(),
    );
  }
}
