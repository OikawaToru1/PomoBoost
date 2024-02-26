import 'dart:async';
import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<StatefulWidget> createState() => _MyTimer();
}

class _MyTimer extends State {
  int remaining;
  Timer? timer;
  String text = "Start";
  int count = 0;

  _MyTimer({int startTime = 25}) : remaining = startTime;

  void start() {
    count++;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining == 0) {
        setState(() {
          if (timer.isActive) {
            timer.cancel();
            text = "Start";
            remaining = 25;
            count--;
          }
        });
      } else if (count % 2 != 0) {
        setState(() {
          text = "Pause";
          remaining--;
        });
      } else {
        setState(() {
          remaining;
          text = "Start";
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              width: 200,
              height: 200,
            ),
            Text(
              "Time is : $remaining",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: start,
              style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: const Size(80, 40),
                  textStyle:
                      const TextStyle(fontSize: 40, color: Colors.black)),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: MyTimer()));
}
