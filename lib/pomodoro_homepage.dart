import 'package:flutter/material.dart';
import 'timer.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class PomoHomePage extends StatefulWidget {
  const PomoHomePage({super.key});

  @override
  State<PomoHomePage> createState() => _PomoHomePageState();
}

class _PomoHomePageState extends State<PomoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          title: const Text("PomoBoost"),
          leading: const Icon(Icons.check_circle_outline_outlined),
          actions: [
            IconButton(
              onPressed: () {
                showPopupCard(
                    context: context,
                    builder: (context) {
                      return PopupCard(
                        elevation: 10,
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.all(20),
                          child: Text(
                            "Your mom here",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.person),
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
        body: const Tab());
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
    return const Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.only(left: 60, right: 60),
          child: SizedBox(
              height: 300, width: double.infinity, child: TabContent()),
        )
      ],
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
          backgroundColor: Colors.black38,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade400,
            bottom: const TabBar(tabs: [
              Text("Pomodoro", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Short Break",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Long Break", style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          body: TabBarView(children: [
            Container(
              color: Colors.blueGrey.shade100,
              alignment: Alignment.center,
              child: const Text(
                "Clock",
                style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(
              Icons.free_breakfast_rounded,
              size: 100,
            ),
            const Icon(
              Icons.food_bank,
              size: 100,
            ),
          ]),
        ),
      ),
    );
  }
}
