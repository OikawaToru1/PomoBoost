import 'dart:async';


import 'package:flutter/material.dart';

class PomoTimer extends StatefulWidget {
  const PomoTimer({super.key});

  @override
  State<StatefulWidget> createState() => _PomoTimer();
}

class _PomoTimer extends State {
  int? _remainingtime;
  int sec = 0;
  Timer? _pomoTimer;

  _PomoTimer({int time = 25}) : _remainingtime = time;

  void _startTimer() {
    Duration oneSec = const Duration(seconds: 1);
    _pomoTimer = Timer.periodic(oneSec, (timer) {
      
      if (sec == 0 && _remainingtime! >= 0) {
        setState(() {
          _remainingtime = _remainingtime! - 1;
          sec = 60;
        });
      } else if (sec == 0 && _remainingtime! < 0) {
        setState(() {
          _pomoTimer?.cancel();
        });
      } else {
        setState(() {
          sec -=1;
          _remainingtime;
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
        Text("$_remainingtime : $sec"),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(onPressed: _startTimer, child: const Text("Start"))
      ],
    ));
  }
}
