import "package:flutter/material.dart";
import "package:pomoboost/firstpage.dart";
import './pomodoro_homepage.dart';

void main() {
  runApp(const MaterialApp(
    title: "PomoBoost",
    home: PomoHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
