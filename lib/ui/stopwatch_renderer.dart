import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stop_watch/ui/elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  final Duration elapsed;

  const StopwatchRenderer({
    Key? key,
    required this.elapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..translate(50.0, 0.0, 0.0)
            ..rotateZ(pi / 4),
          alignment: Alignment.center,
          child: Container(
            color: Colors.indigo,
          ),
        ),
        // ElapsedTimeText(
        //   elapsed: elapsed,
        // ),
      ],
    );
  }
}
