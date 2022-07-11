import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch/ui/clock_hand.dart';
import 'package:stop_watch/ui/elapsed_time_text.dart';

class StopwatchTickerUi extends StatefulWidget {
  final double radius;

  const StopwatchTickerUi({
    Key? key,
    required this.radius,
  }) : super(key: key);

  @override
  State<StopwatchTickerUi> createState() => StopwatchTickerUiState();
}

class StopwatchTickerUiState extends State<StopwatchTickerUi>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _previousElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  Duration get _elapsed => _previousElapsed + _currentElapsed;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  void toggleRunning(bool isRunning) {
    setState(() {
      if (isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previousElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  void reset() {
    _ticker.stop();
    setState(() {
      _previousElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: widget.radius,
          top: widget.radius,
          child: ClockHand(
            // 60000ms is equal to 60seconds
            rotationZAngle: pi + (2 * pi / 60000) * _elapsed.inMilliseconds,
            handThickness: 2.0,
            handLength: widget.radius,
            color: Colors.green,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: widget.radius * 1,
          child: ElapsedTimeText(
            elapsed: _elapsed,
          ),
        ),
      ],
    );
  }
}
