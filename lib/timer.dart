import 'dart:async';

import 'package:flutter/material.dart';

class PomoTimer extends StatefulWidget {
  final int? clockTime;
  const PomoTimer({super.key, required this.clockTime});

  @override
  State<StatefulWidget> createState() {
    return _PomoTimer(clockTime);
  }
}

class _PomoTimer extends State<PomoTimer> {
  int? time;
  int? _remainingMinute;
  int sec = 0, count = 0;
  Timer? _pomoTimer;
  String btnStatus = "Start";

  _PomoTimer(this.time) : _remainingMinute = time;

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
            sec = 59;
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
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text("$_remainingMinute : $sec",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: _startTimer,
            child: Text(btnStatus,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
