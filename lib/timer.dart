import 'dart:async';

import 'package:flutter/material.dart';

class PomoTimer extends StatefulWidget {
  const PomoTimer({super.key});

  @override
  State<StatefulWidget> createState() => _PomoTimer();
}

class _PomoTimer extends State {
  int? _remainingtime;
  Timer? _Pomotimer;
  
   _PomoTimer({int time = 25}) : _remainingtime = time;

  void _startTimer() {
    
    Duration oneSec = Duration(seconds: 1);
    _Pomotimer = Timer.periodic(oneSec, (timer) {
      if (_remainingtime! <= 0) {
        setState(() {
          _Pomotimer!.cancel();
        });
      } else {
        setState(() {
          _remainingtime = _remainingtime! - 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _Pomotimer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
        body: Column(
      children: [
        Text("$_remainingtime"),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(onPressed: _startTimer, child: const Text("Start"))
      ],
    ));
  }
}
