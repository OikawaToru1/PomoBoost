import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';

class PomoTimer extends StatefulWidget {
  const PomoTimer({super.key});

  @override
  State<StatefulWidget> createState() => _PomoTimer();
}

class _PomoTimer extends State {
  int? _remainingMinute;
  int sec = 0, count = 0;
  Timer? _pomoTimer;
  String btnStatus = "Start";

  _PomoTimer({int time = 25}) : _remainingMinute = time;

  void _startTimer() {
    count++;
    Duration oneSec = const Duration(seconds: 1);
    _pomoTimer = Timer.periodic(oneSec, (timer) {
      if (sec == 0 && _remainingMinute! < 0) {
        setState(() {
          _pomoTimer?.cancel();
          _remainingMinute = 25;
          btnStatus = "Start";
          count--;
        });
      } else if (count % 2 != 0) {
        if (sec == 0 && _remainingMinute! >= 0) {
          setState(() {
            _remainingMinute = _remainingMinute! - 1;
            sec = 60;
            btnStatus = "Pause";
          });
        } else {
          setState(() {
            sec -= 1;
            _remainingMinute;
            btnStatus = "Pause";
          });
        }
      } else {
        setState(() {
          timer.cancel();
          _remainingMinute;
          sec;
          btnStatus = "Start";
        });
      }
    });
  }

  @override
  void dispose() {
    _pomoTimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Column(
      children: [
        Text("$_remainingMinute : $sec"),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(onPressed: _startTimer, child: Text(btnStatus)),
      ],
    ));
  }
}
