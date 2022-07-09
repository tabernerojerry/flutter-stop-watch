import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop_watch/ui/clock_hand.dart';
import 'package:stop_watch/ui/clock_markers.dart';
import 'package:stop_watch/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;
  final double radius;

  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i <= 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            // 60000ms is equal to 60seconds
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            handThickness: 2.0,
            handLength: radius,
            color: Colors.green,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: radius * 0.5,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
