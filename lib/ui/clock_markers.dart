import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  final int seconds;
  final double radius;

  const ClockSecondsTickMarker({
    Key? key,
    required this.seconds,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMiddleMarker = seconds % 5 == 0;
    final color = isMiddleMarker ? Colors.white : Colors.grey[700];
    final width = isMiddleMarker ? 3.0 : 2.0;
    const height = 12.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        // move marker in the center
        ..translate(-width / 2, -height / 2, 0.0)
        // position the marker to form a circle
        ..rotateZ(2 * pi * (seconds / 60.0))
        // push away all the marker
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMarker extends StatelessWidget {
  final int value;
  final int maxValue;
  final double radius;

  const ClockTextMarker({
    Key? key,
    required this.value,
    required this.maxValue,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: const TextStyle(fontSize: 24.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
