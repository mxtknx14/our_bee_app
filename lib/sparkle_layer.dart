import 'package:flutter/material.dart';
import 'dart:math';

class SparkleLayer extends StatelessWidget {
  const SparkleLayer({super.key, this.count = 25});
  final int count;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final size = MediaQuery.of(context).size;

    return Stack(
      children: List.generate(count, (index) {
        final left = random.nextDouble() * size.width;
        final top = random.nextDouble() * size.height;
        final sparkleSize = random.nextDouble() * 6 + 2;

        return Positioned(
          left: left,
          top: top,
          child: Opacity(
            opacity: random.nextDouble(),
            child: Container(
              width: sparkleSize,
              height: sparkleSize,
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
