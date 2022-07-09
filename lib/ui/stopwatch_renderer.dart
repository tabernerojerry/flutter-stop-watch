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
    return ElapsedTimeText(
      elapsed: elapsed,
    );
  }
}
