import 'package:flutter/material.dart';
import 'timer.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';

class PomoHomePage extends StatefulWidget {
  const PomoHomePage({
    super.key,
  });

  @override
  State<PomoHomePage> createState() => _PomoHomePageState();
}

class _PomoHomePageState extends State<PomoHomePage> {
  final popcardColor = Colors.pink;
  final double y = 56;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                      color: popcardColor,
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
                  },
                  alignment: Alignment.topRight,
                  offset: Offset(-159, y),
                );
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
                showPopupCard(
                  context: context,
                  builder: (context) {
                    return PopupCard(
                      elevation: 10,
                      color: popcardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Text(
                          "Setting here plss",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  alignment: Alignment.topRight,
                  offset: Offset(-70, y),
                );
              },
              icon: const Icon(Icons.settings),
            ),
            const SizedBox(
              width: 60,
            ),
            IconButton(
              tooltip: "Statistics",
              onPressed: () {
                showPopupCard(
                  context: context,
                  builder: (context) {
                    return PopupCard(
                      elevation: 10,
                      color: popcardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.all(20),
                        child: Text(
                          "Statistics here plss",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                  alignment: Alignment.topRight,
                  offset: Offset(-10, y),
                );
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
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 60, right: 60),
          child: SizedBox(
              height: 350, width: double.infinity, child: TabContent()),
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.lightBlue.shade100,
            bottom: const TabBar(tabs: [
              Text("Pomodoro", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Short Break",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Long Break", style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: tabCard(25),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: tabCard(5),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: tabCard(15),
            ),
          ]),
        ),
      ),
    );
  }
}

class tabCard extends StatelessWidget {
  int widgetTime;
  tabCard(this.widgetTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: PomoTimer(
        clockTime: widgetTime,
      ),
    );
  }
}
