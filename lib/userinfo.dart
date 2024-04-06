import 'package:flutter/material.dart';

showUserInfo() {
  return const Padding(
    padding: EdgeInsets.all(100),
    child: Card(
      color: Colors.blue,
      elevation: 10,
      child: Column(
        children: [
          Text("UserName"),
          SizedBox(
            width: 10,
          ),
          Text("Pink pusay")
        ],
      ),
    ),
  );
}
