import 'dart:math';

import 'package:flutter/material.dart';
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
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.green),
              borderRadius: BorderRadius.circular(radius)),
        )
        // ElapsedTimeText(
        //   elapsed: elapsed,
        // ),
      ],
    );
  }
}
