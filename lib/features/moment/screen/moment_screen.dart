
import 'package:flutter/material.dart';
import '../../../core/painters/moment_card_painter.dart';


class MomentsScreen extends StatelessWidget {
  const MomentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Moments from your year',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 50),

                const MomentCard(
                  period: 'Early 2025',
                  title: 'Focused on productivity\ntools',
                  angle: 0,
                  accentColors: [
                    Color(0xFF8F64F3),
                    Color(0xFF2E5BFF),
                    Color(0xFF8F64F3),
                  ],
                ),
                const SizedBox(height: 15),

                const MomentCard(
                  period: 'Mid 2025',
                  title: 'Delved into home\ndesign',
                  angle: 0.08,
                  accentColors: [
                    Color(0xFFFF6B00),
                    Color(0xFFFFD600),
                    Color(0xFFFF007A),
                  ],
                ),
                const SizedBox(height: 15),

                const MomentCard(
                  period: 'Late 2025',
                  title: 'Explored different\nmusic genres',
                  angle: 0,
                  accentColors: [
                    Color(0xFF9D50BB),
                    Color(0xFFE91E63),
                    Color(0xFF6E48AA),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
