import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stop_watch/ui/elapsed_time_text.dart';
import 'package:stop_watch/ui/reset_button.dart';
import 'package:stop_watch/ui/start_stop_button.dart';
import 'package:stop_watch/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late DateTime _initialTime;
  late final Ticker _ticker;
  bool _isRunning = false;
  Duration _previousElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  Duration get _elapsed => _previousElapsed + _currentElapsed;

  @override
  void initState() {
    super.initState();
    _initialTime = DateTime.now();
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

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;

      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previousElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previousElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              elapsed: _elapsed,
              radius: radius,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: StartStopButton(
                  isRunning: _isRunning,
                  onPressed: _toggleRunning,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
