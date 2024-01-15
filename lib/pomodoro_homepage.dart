import 'package:flutter/material.dart';
import 'timer.dart';

class PomoHomePage extends StatefulWidget {
  const PomoHomePage({super.key});

  @override
  State<PomoHomePage> createState() => _PomoHomePageState();
}

class _PomoHomePageState extends State<PomoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PomoBoost"),
          leading: const Icon(Icons.check_circle_outline_outlined),
          actions: [
            IconButton(
              onPressed: () {
                print("id");
              },
              icon: Icon(Icons.person),
              tooltip: "User Info",
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              tooltip: "Setting",
              onPressed: () {
                print("Settings");
              },
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              tooltip: "Statistics",
              onPressed: () {
                print("Stats");
              },
              icon: const Icon(Icons.receipt_rounded),
            ),
          ],
          actionsIconTheme:
              const IconThemeData(size: 30, weight: 100, color: Colors.black),
          bottomOpacity: 3,
          shadowColor: Colors.black,
        ),
        body: Tab());
  }
}

class Tab extends StatefulWidget {

 const Tab({super.key});

  @override
  State<Tab> createState() => _TabState();
}

class _TabState extends State<Tab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Container(
                decoration:const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
                height: 300,
                width: double.infinity,
                child: const TabContent()),
          )
        ],
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  const TabContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Text("Pomodoro", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Short Break",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Long Break", style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          body: const TabBarView(children: [
            PomoTimer(),
            Text("It will contain break timer"),
            Text("It will contain long break timer"),
          ]),
        ),
      ),
    );
  }
}
